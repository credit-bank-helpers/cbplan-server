CREATE TABLE IF NOT EXISTS member (
  member_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NULL,
  email VARCHAR(255) NULL,
  oauth_provider VARCHAR(255) NULL,
  oauth_id VARCHAR(255) NULL,
  oauth_email VARCHAR(255) NULL,
  profile_image VARCHAR(2047) NULL,
  major_credit INTEGER NULL,
  elective_credit INTEGER NULL,
  general_credit INTEGER NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL,
  major_id BIGINT NULL,
  CONSTRAINT member_major_id_fk FOREIGN KEY (major_id) REFERENCES major (major_id)
);

CREATE TABLE IF NOT EXISTS major
(
    major_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    major_name VARCHAR(255) NULL
);

CREATE TABLE IF NOT EXISTS subject
(
    subject_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(255) NULL,
    subject_credit INTEGER NULL,
    major_id BIGINT NULL,
    CONSTRAINT subject_major_id_fk FOREIGN KEY (major_id) REFERENCES  major (major_id)
);

CREATE TABLE IF NOT EXISTS member_major_credit (
  member_major_credit_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  member_id BIGINT NULL,
  major_id BIGINT NULL,
  major_name VARCHAR NULL,
  subject_id BIGINT NULL,
  subject_name VARCHAR NULL,
  institute_id BIGINT NULL,
  institute_name VARCHAR NULL,
  subject_credit INTEGER NULL,
  CONSTRAINT member_major_credit_member_id_fk FOREIGN KEY (member_id) REFERENCES member (member_id)
);

CREATE TABLE IF NOT EXISTS institute
(
    institute_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    site_url VARCHAR(2047) NULL,
    type VARCHAR(255) NULL,
    institute_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS subject_institute
(
    subject_institute_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    subject_id BIGINT NULL,
    institute_id BIGINT NULL,
    CONSTRAINT subject_institute_subject_id_fk FOREIGN KEY (subject_id) REFERENCES subject (subject_id),
    CONSTRAINT subject_institute_institute_id_fk FOREIGN KEY (institute_id) REFERENCES institute (institute_id)
);

CREATE TABLE IF NOT EXISTS credit_limit
(
    credit_limit_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    institute_limit_credit BIGINT NULL,
    yearly_limit_credit BIGINT NULL
);
