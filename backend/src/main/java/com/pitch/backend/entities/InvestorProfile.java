// package com.pitch.backend.entities;

// import java.util.ArrayList;
// import java.util.List;

// import jakarta.persistence.Column;
// import jakarta.persistence.Entity;
// import jakarta.persistence.GeneratedValue;
// import jakarta.persistence.GenerationType;
// import jakarta.persistence.Id;
// import jakarta.persistence.Table;

// @Entity
// @Table(name = "investor_profile")
// public class InvestorProfile {
//     @Id
//     @GeneratedValue(strategy = GenerationType.IDENTITY)
//     private Long id;

//     @Column(name = "first_name", nullable = true)
//     private String firstName;
//     @Column(name = "last_name", nullable = true)
//     private String lastName;
//     @Column(name = "company_name", nullable = true)
//     private String companyName;
//     @Column(name = "preferences", nullable = false)
//     private List<String> preferences = new ArrayList<>();
//     @Column(name = "investment_min", nullable = true)
//     private Integer investmentMin;
//     @Column(name = "investment_max", nullable = true)
//     private Integer investmentMax;
//     @Column(name = "linkedin_url", nullable = true)
//     private String linkedInURL;
//     @Column(name = "instagram_url", nullable = true)
//     private String instagramURL;

//     public InvestorProfile() {}
// }
