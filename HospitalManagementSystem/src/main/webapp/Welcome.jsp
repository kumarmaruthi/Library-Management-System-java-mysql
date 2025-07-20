<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Search | MediCare HMS</title>
    <style>
        /* [Previous CSS content remains exactly the same] */
    </style>
</head>
<body>
    <!-- [Previous HTML content remains exactly the same until the script section] -->

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const DoctorSearchApp = {
            // DOM Elements
            elements: {
                doctorSearch: document.getElementById('doctor-search'),
                searchResults: document.getElementById('search-results'),
                loadingIndicator: document.getElementById('loading-indicator'),
                doctorNameDisplay: document.getElementById('doctor-name-display'),
                patientsData: document.getElementById('patients-data'),
                resultsSection: document.getElementById('doctor-patients-results')
            },
            
            // Initialize the application
            init: function() {
                this.setupEventListeners();
                console.log("Doctor Search Application initialized");
            },
            
            // Set up all event listeners
            setupEventListeners: function() {
                const debouncedSearch = this.debounce(this.handleSearch.bind(this), 300);
                this.elements.doctorSearch.addEventListener('input', debouncedSearch);
                
                // Close results when clicking outside
                document.addEventListener('click', (e) => {
                    if (e.target !== this.elements.doctorSearch && 
                        !this.elements.searchResults.contains(e.target)) {
                        this.elements.searchResults.style.display = 'none';
                    }
                });
            },
            
            // Debounce function to limit API calls
            debounce: function(func, delay) {
                let timeout;
                return function() {
                    const context = this;
                    const args = arguments;
                    clearTimeout(timeout);
                    timeout = setTimeout(() => func.apply(context, args), delay);
                };
            },
            
            // Handle search input
            handleSearch: function() {
                const searchTerm = this.elements.doctorSearch.value.trim();
                
                if (searchTerm.length < 2) {
                    this.elements.searchResults.style.display = 'none';
                    return;
                }
                
                this.showLoading();
                console.log("Searching for doctors:", searchTerm);
                
                this.fetchDoctors(searchTerm)
                    .then(doctors => this.displayDoctors(doctors))
                    .catch(error => this.handleError(error, "doctor search"));
            },
            
            // Fetch doctors from API
            fetchDoctors: async function(searchTerm) {
                const response = await fetch(`${this.getBaseUrl()}/api/doctor-patient/search-doctors?search=${encodeURIComponent(searchTerm)}`);
                
                if (!response.ok) {
                    const error = await response.json().catch(() => ({}));
                    throw new Error(error.error || 'Failed to fetch doctors');
                }
                
                return response.json();
            },
            
            // Display doctor results
            displayDoctors: function(doctors) {
                this.elements.searchResults.innerHTML = '';
                
                if (!doctors || doctors.length === 0) {
                    this.showNoResults();
                    return;
                }
                
                doctors.forEach(doctor => {
                    const item = document.createElement('div');
                    item.className = 'search-result-item';
                    item.textContent = doctor;
                    item.addEventListener('click', () => this.selectDoctor(doctor));
                    this.elements.searchResults.appendChild(item);
                });
                
                this.elements.searchResults.style.display = 'block';
                this.hideLoading();
            },
            
            // Handle doctor selection
            selectDoctor: function(doctorName) {
                this.elements.doctorSearch.value = doctorName;
                this.elements.searchResults.style.display = 'none';
                this.loadPatients(doctorName);
            },
            
            // Load patients for selected doctor
            loadPatients: function(doctorName) {
                this.elements.doctorNameDisplay.textContent = doctorName;
                this.showLoading();
                
                this.fetchPatients(doctorName)
                    .then(patients => this.displayPatients(patients))
                    .catch(error => this.handleError(error, "loading patients"));
            },
            
            // Fetch patients from API
            fetchPatients: async function(doctorName) {
                const response = await fetch(`${this.getBaseUrl()}/api/doctor-patient/get-patients?doctorName=${encodeURIComponent(doctorName)}`);
                
                if (!response.ok) {
                    const error = await response.json().catch(() => ({}));
                    throw new Error(error.error || 'Failed to fetch patients');
                }
                
                return response.json();
            },
            
            // Display patient results
            displayPatients: function(patients) {
                this.elements.patientsData.innerHTML = '';
                
                if (!patients || patients.length === 0) {
                    this.elements.patientsData.innerHTML = 
                        '<tr><td colspan="13" style="text-align:center;">No patients found for this doctor</td></tr>';
                } else {
                    patients.forEach((patient, index) => {
                        this.elements.patientsData.appendChild(this.createPatientRow(patient, index + 1));
                    });
                }
                
                this.elements.resultsSection.style.display = 'block';
                this.hideLoading();
            },
            
            // Create table row for a patient
            createPatientRow: function(patient, index) {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${index}</td>
                    <td>${this.sanitize(patient.firstName)}</td>
                    <td>${this.sanitize(patient.middleName)}</td>
                    <td>${this.sanitize(patient.lastName)}</td>
                    <td>${this.sanitize(patient.age)}</td>
                    <td>${this.sanitize(patient.gender)}</td>
                    <td>${this.sanitize(patient.patientId)}</td>
                    <td>${this.sanitize(patient.contactNumber)}</td>
                    <td>${this.sanitize(patient.emailAddress)}</td>
                    <td>${this.sanitize(patient.address)}</td>
                    <td>${this.sanitize(patient.diseaseDiagnosis)}</td>
                    <td>${this.sanitize(patient.symptoms)}</td>
                    <td>${this.sanitize(patient.department)}</td>
                `;
                return row;
            },
            
            // Simple sanitization for display
            sanitize: function(value) {
                return value && value.toString().trim() || '-';
            },
            
            // Show no results message
            showNoResults: function() {
                const item = document.createElement('div');
                item.className = 'search-result-item';
                item.textContent = 'No doctors found';
                this.elements.searchResults.appendChild(item);
                this.elements.searchResults.style.display = 'block';
                this.hideLoading();
            },
            
            // Show loading indicator
            showLoading: function() {
                this.elements.loadingIndicator.style.display = 'block';
            },
            
            // Hide loading indicator
            hideLoading: function() {
                this.elements.loadingIndicator.style.display = 'none';
            },
            
            // Handle errors
            handleError: function(error, context) {
                console.error(`Error during ${context}:`, error);
                this.hideLoading();
                
                // In a production app, consider a more elegant error display
                alert(`Error: ${error.message || 'An unexpected error occurred'}`);
            },
            
            // Get base URL for API calls
            getBaseUrl: function() {
                const contextPath = window.location.pathname.split('/')[1];
                return window.location.origin + (contextPath ? `/${contextPath}` : '');
            }
        };
        
        DoctorSearchApp.init();
    });
    </script>
</body>
</html>