-- Table for Persons
-- Each person has a unique ID, first name, last name which are mandatory fields.
-- Birth date is optional, but if provided, it should be a valid date.
-- gender is also optional, but if provided, it should be one of the values:
-- 'm' for male
-- 'f' for female
-- 'o' for other (non-binary, genderqueer, etc.)
-- birth_place is optional and can be a string up to 100 characters.
-- profile_image is optional and can be a URL to the person's profile image.
--
CREATE TABLE person (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    gender CHAR(1) CHECK (gender IN ('m', 'f', 'o')), -- m: male, f: female, o: other
    birth_place VARCHAR(100),
    profile_image VARCHAR(255),
    last_checkout DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Table for Relationships between Persons
-- Each relationship has a unique ID, person_id1, person_id2 which are foreign keys to the person table.
-- relationship_type is a string that can be one of the values: 'parent', 'child', 'spouse', 'sibling'.
-- start_date is the date when the relationship started. -> if the relationship is child-parent, this can be the birth date of the child.
-- end_date is the date when the relationship ended (if applicable). -> if the relationship is child-parent, 
-- this can be the date when the child was adopted. Or is spouse, this can be the date of divorce.
CREATE TABLE relationship (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    person_id1 UUID REFERENCES person(id) ON DELETE CASCADE,
    person_id2 UUID REFERENCES person(id) ON DELETE CASCADE,
    relationship_type VARCHAR(50) CHECK (relationship_type IN (
    'parent', 
    'child', 
    'mother', 
    'father', 
    'son', 
    'daughter', 
    'grandparent', 
    'grandchild',
    'grandmother', 
    'grandfather', 
    'grandson', 
    'granddaughter', 
    'sibling', 
    'brother', 
    'sister',
    'half_sibling', 
    'half_brother', 
    'half_sister', 
    'step_sibling', 
    'step_brother', 
    'step_sister',
    'step_parent', 
    'step_child', 
    'uncle', 
    'aunt', 
    'nephew', 
    'niece', 
    'cousin', 
    'adoptive_parent',
    'adoptive_child', 
    'spouse', 
    'husband', 
    'wife', 
    'partner', 
    'fiance', 
    'ex_spouse', 
    'ex_partner',
    'boyfriend', 
    'girlfriend', 
    'friend', 
    'best_friend', 
    'acquaintance', 
    'colleague', 
    'business_partner',
    'neighbor', 
    'mentor', 
    'mentee', 
    'client', 
    'employee', 
    'employer')),
    start_date DATE,
    end_date DATE
);

-- Optional Table for Addresses
-- Each address has a unique ID, person_id which is a foreign key to the person table.
-- street, city, postal_code, country are strings that represent the address.
-- 
CREATE TABLE address (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    person_id UUID REFERENCES person(id) ON DELETE CASCADE,
    street VARCHAR(100),
    city VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(50)
);

-- Optional Table for Events
-- Each event has a unique ID, person_id which is a foreign key to the person table.
-- event_type is a string that can be one of the values: 'birth', 'marriage', 'death'.
-- event_date is the date when the event occurred.
-- description is a text field that describes the event.
CREATE TABLE event (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    person_id UUID REFERENCES person(id) ON DELETE CASCADE,
    event_type VARCHAR(50) CHECK (event_type IN ('birth', 'marriage', 'death')),
    event_date DATE,
    description TEXT
);

-- Table for Contact Information
-- Each contact has a unique ID, person_id which is a foreign key to the person table.
-- phone_number, email, social_media_handle are strings that represent the contact information.
CREATE TABLE contact (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    person_id UUID REFERENCES person(id) ON DELETE CASCADE,
    phone_number VARCHAR(20),
    email VARCHAR(100)
);
