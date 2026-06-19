# Database Design - Entity-Relationship (ER) Model

This laboratory covers the requirements analysis and conceptual database design for an internship allocation system at ANCiber.

## 📝 Problem Description
The system manages student enrollments, approved modules with grades, and course editions (which define the minimum credits required to apply for an internship). Students can select up to three internship choices in order of preference. The system automatically assigns internships based on the highest GPA and preference.

## 📊 Entity-Relationship Diagram (ERD)
Below is the conceptual model developed to satisfy all business rules and integrity constraints:

![Entity-Relationship Diagram](diagrama_entidade_associacao.png)

## 🔒 Advanced Business Rules (RIAs)
To enforce data integrity, the following Additional Integrity Rules (RIAs) were mapped:
*   **RIA-1:** A student can select a maximum of 3 internship choices.
*   **RIA-2:** The preference order must strictly be 1, 2, or 3.
*   **RIA-3:** The assigned supervisor must work for the same organization that offers the internship.
*   **RIA-4:** The allocated internship must be one of the choices previously selected by the student.
