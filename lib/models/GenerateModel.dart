// To parse this JSON data, do
//
//     final generateModel = generateModelFromJson(jsonString);

import 'dart:convert';

GenerateModel generateModelFromJson(String str) => GenerateModel.fromJson(json.decode(str));

String generateModelToJson(GenerateModel data) => json.encode(data.toJson());

class GenerateModel {
  GenerateModel({
    this.firstname,
    this.lastname,
    this.contact,
    this.skills,
    this.githubProjects,
    this.otherProjects,
    this.workExperience,
    this.involvement,
    this.education,
    this.researchExperience,
  });

  String firstname;
  String lastname;
  Contact contact;
  Skills skills;
  GithubProjects githubProjects;
  OtherProjects otherProjects;
  WorkExperience workExperience;
  Involvement involvement;
  Education education;
  ResearchExperience researchExperience;

  factory GenerateModel.fromJson(Map<String, dynamic> json) => GenerateModel(
    firstname: json["firstname"],
    lastname: json["lastname"],
    contact: Contact.fromJson(json["contact"]),
    skills: Skills.fromJson(json["skills"]),
    githubProjects: GithubProjects.fromJson(json["github_projects"]),
    otherProjects: OtherProjects.fromJson(json["other_projects"]),
    workExperience: WorkExperience.fromJson(json["work_experience"]),
    involvement: Involvement.fromJson(json["involvement"]),
    education: Education.fromJson(json["education"]),
    researchExperience: ResearchExperience.fromJson(json["research_experience"]),
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "contact": contact.toJson(),
    "skills": skills.toJson(),
    "github_projects": githubProjects.toJson(),
    "other_projects": otherProjects.toJson(),
    "work_experience": workExperience.toJson(),
    "involvement": involvement.toJson(),
    "education": education.toJson(),
    "research_experience": researchExperience.toJson(),
  };
}

class Contact {
  Contact({
    this.email,
    this.phone,
    this.website,
    this.linkedin,
    this.github,
  });

  String email;
  String phone;
  String website;
  String linkedin;
  String github;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    email: json["email"],
    phone: json["phone"],
    website: json["website"],
    linkedin: json["linkedin"],
    github: json["github"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "phone": phone,
    "website": website,
    "linkedin": linkedin,
    "github": github,
  };
}

class Education {
  Education({
    this.schools,
  });

  List<School> schools;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
    schools: List<School>.from(json["schools"].map((x) => School.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "schools": List<dynamic>.from(schools.map((x) => x.toJson())),
  };
}

class School {
  School({
    this.degree,
    this.major,
    this.institution,
    this.graduationYear,
  });

  String degree;
  String major;
  String institution;
  int graduationYear;

  factory School.fromJson(Map<String, dynamic> json) => School(
    degree: json["degree"],
    major: json["major"],
    institution: json["institution"],
    graduationYear: json["graduation_year"],
  );

  Map<String, dynamic> toJson() => {
    "degree": degree,
    "major": major,
    "institution": institution,
    "graduation_year": graduationYear,
  };
}

class GithubProjects {
  GithubProjects({
    this.items,
  });

  List<GithubProjectsItem> items;

  factory GithubProjects.fromJson(Map<String, dynamic> json) => GithubProjects(
    items: List<GithubProjectsItem>.from(json["items"].map((x) => GithubProjectsItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class GithubProjectsItem {
  GithubProjectsItem({
    this.projectName,
    this.tagline,
    this.description,
    this.technologyUsed,
  });

  String projectName;
  String tagline;
  List<String> description;
  TechnologyUsed technologyUsed;

  factory GithubProjectsItem.fromJson(Map<String, dynamic> json) => GithubProjectsItem(
    projectName: json["project_name"],
    tagline: json["tagline"],
    description: List<String>.from(json["description"].map((x) => x)),
    technologyUsed: TechnologyUsed.fromJson(json["technology_used"]),
  );

  Map<String, dynamic> toJson() => {
    "project_name": projectName,
    "tagline": tagline,
    "description": List<dynamic>.from(description.map((x) => x)),
    "technology_used": technologyUsed.toJson(),
  };
}

class TechnologyUsed {
  TechnologyUsed({
    this.tools,
  });

  List<String> tools;

  factory TechnologyUsed.fromJson(Map<String, dynamic> json) => TechnologyUsed(
    tools: List<String>.from(json["tools"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "tools": List<dynamic>.from(tools.map((x) => x)),
  };
}

class Involvement {
  Involvement({
    this.organizations,
  });

  List<String> organizations;

  factory Involvement.fromJson(Map<String, dynamic> json) => Involvement(
    organizations: List<String>.from(json["organizations"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "organizations": List<dynamic>.from(organizations.map((x) => x)),
  };
}

class OtherProjects {
  OtherProjects({
    this.items,
  });

  List<OtherProjectsItem> items;

  factory OtherProjects.fromJson(Map<String, dynamic> json) => OtherProjects(
    items: List<OtherProjectsItem>.from(json["items"].map((x) => OtherProjectsItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class OtherProjectsItem {
  OtherProjectsItem({
    this.headline,
    this.points,
    this.technologyUsed,
  });

  String headline;
  List<String> points;
  TechnologyUsed technologyUsed;

  factory OtherProjectsItem.fromJson(Map<String, dynamic> json) => OtherProjectsItem(
    headline: json["headline"],
    points: List<String>.from(json["points"].map((x) => x)),
    technologyUsed: TechnologyUsed.fromJson(json["technology_used"]),
  );

  Map<String, dynamic> toJson() => {
    "headline": headline,
    "points": List<dynamic>.from(points.map((x) => x)),
    "technology_used": technologyUsed.toJson(),
  };
}

class ResearchExperience {
  ResearchExperience({
    this.items,
  });

  List<ResearchExperienceItem> items;

  factory ResearchExperience.fromJson(Map<String, dynamic> json) => ResearchExperience(
    items: List<ResearchExperienceItem>.from(json["items"].map((x) => ResearchExperienceItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class ResearchExperienceItem {
  ResearchExperienceItem({
    this.title,
    this.organisation,
    this.from,
    this.to,
    this.points,
  });

  String title;
  String organisation;
  String from;
  String to;
  List<String> points;

  factory ResearchExperienceItem.fromJson(Map<String, dynamic> json) => ResearchExperienceItem(
    title: json["title"],
    organisation: json["organisation"],
    from: json["from"],
    to: json["to"],
    points: List<String>.from(json["points"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "organisation": organisation,
    "from": from,
    "to": to,
    "points": List<dynamic>.from(points.map((x) => x)),
  };
}

class Skills {
  Skills({
    this.details,
  });

  List<Detail> details;

  factory Skills.fromJson(Map<String, dynamic> json) => Skills(
    details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "details": List<dynamic>.from(details.map((x) => x.toJson())),
  };
}

class Detail {
  Detail({
    this.type,
    this.items,
  });

  String type;
  List<String> items;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    type: json["type"],
    items: List<String>.from(json["items"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "items": List<dynamic>.from(items.map((x) => x)),
  };
}

class WorkExperience {
  WorkExperience({
    this.items,
  });

  List<WorkExperienceItem> items;

  factory WorkExperience.fromJson(Map<String, dynamic> json) => WorkExperience(
    items: List<WorkExperienceItem>.from(json["items"].map((x) => WorkExperienceItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class WorkExperienceItem {
  WorkExperienceItem({
    this.title,
    this.organisation,
    this.location,
    this.from,
    this.to,
    this.details,
    this.technologyUsed,
  });

  String title;
  String organisation;
  String location;
  String from;
  String to;
  List<String> details;
  TechnologyUsed technologyUsed;

  factory WorkExperienceItem.fromJson(Map<String, dynamic> json) => WorkExperienceItem(
    title: json["title"],
    organisation: json["organisation"],
    location: json["location"],
    from: json["from"],
    to: json["to"],
    details: List<String>.from(json["details"].map((x) => x)),
    technologyUsed: TechnologyUsed.fromJson(json["technology_used"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "organisation": organisation,
    "location": location,
    "from": from,
    "to": to,
    "details": List<dynamic>.from(details.map((x) => x)),
    "technology_used": technologyUsed.toJson(),
  };
}
