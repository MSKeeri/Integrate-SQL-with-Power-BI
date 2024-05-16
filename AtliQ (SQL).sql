Month_-- Table from April

CREATE TABLE Month_April(
    "AtliQ" TEXT,
    "Name" TEXT,
    "01-Apr" TEXT,
    "02-Apr" TEXT,
    "03-Apr" TEXT,
    "04-Apr" TEXT,
    "05-Apr" TEXT,
    "06-Apr" TEXT,
    "07-Apr" TEXT,
    "08-Apr" TEXT,
    "09-Apr" TEXT,
    "10-Apr" TEXT,
    "11-Apr" TEXT,
    "12-Apr" TEXT,
    "13-Apr" TEXT,
    "14-Apr" TEXT,
    "15-Apr" TEXT,
    "16-Apr" TEXT,
    "17-Apr" TEXT,
    "18-Apr" TEXT,
    "19-Apr" TEXT,
    "20-Apr" TEXT,
    "21-Apr" TEXT,
    "22-Apr" TEXT,
    "23-Apr" TEXT,
    "24-Apr" TEXT,
    "25-Apr" TEXT,
    "26-Apr" TEXT,
    "27-Apr" TEXT,
    "28-Apr" TEXT,
    "29-Apr" TEXT,
    "30-Apr" TEXT,
    "Total Present Days" NUMERIC,
    "Present" NUMERIC,
    "Work from home" NUMERIC,
    "Paid Leave" NUMERIC,
    "Sick Leave" NUMERIC,
    "Birthday Leave" NUMERIC,
    "Floting festival leave" NUMERIC,
    "Bereavement Leave" NUMERIC,
    "Leave without pay" NUMERIC,
    "Weekly Off" NUMERIC,
    "Holidays Off" NUMERIC,
    "Menstrual Leave" NUMERIC
);
COPY Month_April FROM 'E:\project\April.csv' WITH CSV HEADER;
SELECT * FROM Month_April;
-- *******
-- Table from May
CREATE TABLE May_attend (
    "AtliQ" TEXT,
    "Name" TEXT,
    "02-May" TEXT,
    "03-May" TEXT,
    "04-May" TEXT,
    "05-May" TEXT,
    "06-May" TEXT,
    "07-May" TEXT,
    "08-May" TEXT,
    "09-May" TEXT,
    "10-May" TEXT,
    "11-May" TEXT,
    "12-May" TEXT,
    "13-May" TEXT,
    "14-May" TEXT,
    "15-May" TEXT,
    "16-May" TEXT,
    "17-May" TEXT,
    "18-May" TEXT,
    "19-May" TEXT,
    "20-May" TEXT,
    "21-May" TEXT,
    "22-May" TEXT,
    "23-May" TEXT,
    "24-May" TEXT,
    "25-May" TEXT,
    "26-May" TEXT,
    "27-May" TEXT,
    "28-May" TEXT,
    "29-May" TEXT,
    "30-May" TEXT,
    "31-May" TEXT,
    "Total Present Days" NUMERIC,
    "Present" NUMERIC,
    "Work from home" NUMERIC,
    "Paid Leave" NUMERIC,
    "Sick Leave" NUMERIC,
    "Birthday Leave" NUMERIC,
    "Floting festival leave" NUMERIC,
    "Bereavement Leave" NUMERIC,
    "Leave without pay" NUMERIC,
    "Weekly Off" NUMERIC,
    "Holidays Off" NUMERIC,
    "Menstrual Leave" NUMERIC
);
COPY May_attend FROM 'E:\project\Month_may.csv' WITH CSV HEADER;
SELECT * FROM May_attend
-- *******
-- Table from June
CREATE TABLE Month_June(
    "AtliQ" TEXT,
    "Name" TEXT,
    "01-Jun" TEXT,
    "02-Jun" TEXT,
    "03-Jun" TEXT,
    "04-Jun" TEXT,
    "05-Jun" TEXT,
    "06-Jun" TEXT,
    "07-Jun" TEXT,
    "08-Jun" TEXT,
    "09-Jun" TEXT,
    "10-Jun" TEXT,
    "11-Jun" TEXT,
    "12-Jun" TEXT,
    "13-Jun" TEXT,
    "14-Jun" TEXT,
    "15-Jun" TEXT,
    "16-Jun" TEXT,
    "17-Jun" TEXT,
    "18-Jun" TEXT,
    "19-Jun" TEXT,
    "20-Jun" TEXT,
    "21-Jun" TEXT,
    "22-Jun" TEXT,
    "23-Jun" TEXT,
    "24-Jun" TEXT,
    "25-Jun" TEXT,
    "26-Jun" TEXT,
    "27-Jun" TEXT,
    "28-Jun" TEXT,
    "29-Jun" TEXT,
    "30-Jun" TEXT,
    "Total Present Days" NUMERIC,
    "Present" NUMERIC,
    "Work from home" NUMERIC,
    "Paid Leave" NUMERIC,
    "Sick Leave" NUMERIC,
    "Birthday Leave" NUMERIC,
    "Floting festival leave" NUMERIC,
    "Bereavement Leave" NUMERIC,
    "Leave without pay" NUMERIC,
    "Weekly Off" NUMERIC,
    "Holidays Off" NUMERIC,
    "Menstrual Leave" NUMERIC
);
COPY Month_June FROM 'E:\project\June.csv' WITH CSV HEADER;
SELECT * FROM Month_June

SELECT DISTINCT "Name","AtliQ"

CREATE TABLE Total_attendence (
    "Name" TEXT,
    "AtliQ" TEXT,
    "Total Present Days" NUMERIC,
    "Total Present" NUMERIC,
    "Total Work from home" NUMERIC,
    "Total Paid Leave" NUMERIC,
    "Total Sick Leave" NUMERIC,
    "Total Birthday Leave" NUMERIC,
    "Total Floting festival leave" NUMERIC,
    "Total Bereavement Leave" NUMERIC,
    "Total Leave without pay" NUMERIC,
    "Total Weekly Off" NUMERIC,
    "Total Holidays Off" NUMERIC,
    "Total Menstrual Leave" NUMERIC
);

-- Step 2: Insert the aggregated results into the new table
INSERT INTO Total_attendence ("Name","AtliQ", "Total Present Days", "Total Present","Total Work from home","Total Paid Leave","Total Sick Leave","Total Birthday Leave","Total Floting festival leave","Total Bereavement Leave","Total Leave without pay","Total Weekly Off","Total Holidays Off","Total Menstrual Leave")


WITH combined_tables AS (
    SELECT DISTINCT"Name","AtliQ" FROM Month_April
    UNION
    SELECT DISTINCT "Name","AtliQ" FROM May_attend
    UNION
    SELECT DISTINCT"Name","AtliQ" FROM Month_June
),
total_April AS (
    SELECT "Name","AtliQ", "Total Present Days","Present","Work from home","Paid Leave","Sick Leave","Birthday Leave","Floting festival leave","Bereavement Leave","Leave without pay","Weekly Off","Holidays Off","Menstrual Leave" FROM Month_April
),
total_May AS (
    SELECT "Name","AtliQ", "Total Present Days","Present","Work from home","Paid Leave","Sick Leave","Birthday Leave","Floting festival leave","Bereavement Leave","Leave without pay","Weekly Off","Holidays Off","Menstrual Leave" FROM  May_attend
),
total_June AS (
    SELECT "Name","AtliQ", "Total Present Days","Present","Work from home","Paid Leave","Sick Leave","Birthday Leave","Floting festival leave","Bereavement Leave","Leave without pay","Weekly Off","Holidays Off","Menstrual Leave" FROM Month_June
)
SELECT
    combined_tables."Name",
    combined_tables."AtliQ",
--     total_present_days,
    COALESCE(total_April."Total Present Days", 0) +
    COALESCE(total_May."Total Present Days", 0) +
    COALESCE(total_June."Total Present Days", 0) AS "Total Present Days",
    
    --     total_present_days,
    COALESCE(total_April."Present", 0) +
    COALESCE(total_May."Present", 0) +
    COALESCE(total_June."Present", 0) AS "Total Present",
--     total_Work_from_home
    COALESCE(total_April."Work from home", 0) +
    COALESCE(total_May."Work from home", 0) +
    COALESCE(total_June."Work from home", 0) AS "Total Work from home",
    --     total_paid_leave
    COALESCE(total_April."Paid Leave", 0) +
    COALESCE(total_May."Paid Leave", 0) +
    COALESCE(total_June."Paid Leave", 0) AS "Total Paid Leave",
    --     total_sick_leave
    COALESCE(total_April."Sick Leave", 0) +
    COALESCE(total_May."Sick Leave", 0) +
    COALESCE(total_June."Sick Leave", 0) AS "Total Sick Leave",
    --     total_birtday_leave
    COALESCE(total_April."Birthday Leave", 0) +
    COALESCE(total_May."Birthday Leave", 0) +
    COALESCE(total_June."Birthday Leave", 0) AS "Total Birthday Leave",
    --     total_floting_festival_leave
    COALESCE(total_April."Floting festival leave", 0) +
    COALESCE(total_May."Floting festival leave", 0) +
    COALESCE(total_June."Floting festival leave", 0) AS "Total Floting festival leave",
    --     total_bereavement_leave
    COALESCE(total_April."Bereavement Leave" , 0) +
    COALESCE(total_May."Bereavement Leave" , 0) +
    COALESCE(total_June."Bereavement Leave" , 0) AS "Total Bereavement Leave",
    --    total_leave_without_pay
    COALESCE(total_April."Leave without pay", 0) +
    COALESCE(total_May."Leave without pay", 0) +
    COALESCE(total_June."Leave without pay", 0) AS "Total Leave without pay",
    --     total_weekly_off
    COALESCE(total_April."Weekly Off", 0) +
    COALESCE(total_May."Weekly Off", 0) +
    COALESCE(total_June."Weekly Off", 0) AS "Total Weekly Off",
    --     total_holidays_off
    COALESCE(total_April."Holidays Off", 0) +
    COALESCE(total_May."Holidays Off", 0) +
    COALESCE(total_June."Holidays Off", 0) AS "Total Holidays Off",
    --     total_menstrual_leave
    COALESCE(total_April."Menstrual Leave", 0) +
    COALESCE(total_May."Menstrual Leave", 0) +
    COALESCE(total_June."Menstrual Leave", 0) AS "Total Menstrual Leave"
FROM combined_tables
LEFT JOIN total_April ON combined_tables."Name"= total_April."Name"AND combined_tables."AtliQ"= total_April."AtliQ"
LEFT JOIN total_May ON combined_tables."Name" = total_May."Name"AND combined_tables."AtliQ"= total_May."AtliQ"
LEFT JOIN total_June ON combined_tables."Name" = total_June."Name"AND combined_tables."AtliQ" = total_June."AtliQ"
ORDER BY combined_tables."AtliQ" ASC;

SELECT *FROM Total_attendence
-- **********


SELECT "Name"
FROM April
WHERE "Name" NOT IN (SELECT "Name" FROM June);