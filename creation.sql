--1.TRAIN RELATION
CREATE TABLE TRAIN(
    TRAIN_NUMBER NUMBER,
    RUNNING_DAYS CHAR(7),
    TRAIN_NAME VARCHAR(255),
    PRIMARY KEY (TRAIN_NUMBER),
    FOREIGN KEY (TRAIN_NAME) REFERENCES TRAIN_TYPE
);

--2.TRAIN_DETAILS RELATION
CREATE TABLE TRAIN_DETAILS(
    TRAIN_TYPE VARCHAR(255),
    GOODS_COUNT INT,
    GEN_COUNT INT,
    GEN_COST_KM FLOAT,
    SL_COUNT INT,
    SL_COST_KM FLOAT,
    AC_COUNT INT,
    AC_COST_KM FLOAT,
    PRIMARY KEY (TRAIN_TYPE)
);

--14.TRAIN_TYPE RELATION
CREATE TABLE TRAIN_TYPE(
    TRAIN_NAME VARCHAR(255),
    TYPE VARCHAR(255),
    PRIMARY KEY (TRAIN_NAME),
    FOREIGN KEY (TYPE) REFERENCES TRAIN_DETAILS
);

--3.STATION RELATION
CREATE TABLE STATION(
    STATION_CODE VARCHAR(255),
    STATION_NAME VARCHAR(255),
    CITY VARCHAR(255),
    STATE VARCHAR(255),
    PLATFORM_COUNT NUMBER,
    PRIMARY KEY (STATION_CODE)
);

--4.PNR RELATION
CREATE TABLE PNR(
    PNR_NUMBER NUMBER,
    JDATE DATE,
    TRAIN_NUMBER NUMBER ,
    START_CODE VARCHAR(255),
    END_CODE VARCHAR(255),
    JCLASS CHAR(2),
    JQUOTA VARCHAR(255),
    PHN_NUMBER NUMBER,
    PRIMARY KEY(PNR_NUMBER),
    FOREIGN KEY (TRAIN_NUMBER) REFERENCES TRAIN,
    FOREIGN KEY (START_CODE) REFERENCES STATION,
    FOREIGN KEY (END_CODE) REFERENCES STATION
);

--5.PASSENGER RELATION
CREATE TABLE PASSENGER(
    PNR_NUMBER NUMBER,
    SEAT_NO INT,
    PNAME VARCHAR(255),
    AGE NUMBER,
    GENDER CHAR(1),
    COACH VARCHAR(255),
    PRIMARY KEY(PNR_NUMBER,SEAT_NO,COACH),
    FOREIGN KEY (PNR_NUMBER) REFERENCES PNR
);

--6.EMPLOYEE RELATION
CREATE TABLE EMPLOYEE(
    EMP_ID NUMBER,
    emp_name varchar(255),
    DESIGNATION VARCHAR(255),
    SALARY NUMBER,
    DOJ DATE,
    STATION_CODE VARCHAR(255),
    PRIMARY KEY (EMP_ID),
    FOREIGN KEY (STATION_CODE) REFERENCES STATION
);

--7.COUNTER RELATION
CREATE TABLE COUNTER(
    COUNTER_ID NUMBER,
    STN_CODE VARCHAR(255),
    CITY VARCHAR(255),
    AREA VARCHAR(255),
    PINCODE NUMBER,
    PRIMARY KEY (COUNTER_ID),
    FOREIGN KEY (STN_CODE) REFERENCES STATION
);

--8.STALL_DETAILS relation
CREATE TABLE STALL_DETAILS (
    STALL_ID NUMBER,
    STN_CODE VARCHAR(255),
    RENT FLOAT,
    CONTRACTOR_NAME VARCHAR(255),
    CONTRACTOR_PHN_NUMBER NUMBER,
    PRIMARY KEY (STALL_ID),
    FOREIGN KEY (STN_CODE) REFERENCES STATION
);

--9.STATION_WORKERS relation
CREATE TABLE STATION_WORKERS (
    EMP_ID NUMBER,
    WDATE DATE,
    SHIFT CHAR(1),
    PLATFORM_NO INT,
    PRIMARY KEY (EMP_ID,WDATE,SHIFT),
    FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE
);

--10.COUNTER_EMP relation
CREATE TABLE COUNTER_EMP (
    COUNTER_ID NUMBER,
    SHIFT CHAR(1),
    WDATE DATE,
    EMP_ID NUMBER,
    PRIMARY KEY (COUNTER_ID,SHIFT,WDATE),
    FOREIGN KEY (COUNTER_ID) REFERENCES COUNTER,
    FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE
);

--11.SCHEDULE relation
CREATE TABLE SCHEDULE(
    TRAIN_NUMBER NUMBER,
    STN_CODE VARCHAR(255),
    ARR_TIME TIMESTAMP,
    DEP_TIME TIMESTAMP,
    DAY_NUMBER NUMBER,
    DIST_COVERED NUMBER,
    PRIMARY KEY (TRAIN_NUMBER,STN_CODE),
    FOREIGN KEY (TRAIN_NUMBER) REFERENCES TRAIN,
    FOREIGN KEY (STN_CODE) REFERENCES STATION
);

--12.WEEK_SCHEDULE relation
CREATE TABLE WEEK_SCHEDULE(
    TRAIN_NUMBER NUMBER,
    STN_CODE VARCHAR(255),
    ARR_TIME TIMESTAMP,
    DEP_TIME TIMESTAMP,
    DAY_NUMBER NUMBER,
    PRIMARY KEY (TRAIN_NUMBER,STN_CODE,ARR_TIME),
    FOREIGN KEY (TRAIN_NUMBER) REFERENCES TRAIN,
    FOREIGN KEY (STN_CODE) REFERENCES STATION
);

--13.CURRENT_WORKERS SCHEDULE
CREATE TABLE CURRENT_WORKERS(
    TRAIN_NUMBER NUMBER,
    START_STN_CODE VARCHAR(255),
    WDATE DATE,
    EMP_ID NUMBER,
    END_STN_CODE VARCHAR(255),
    PRIMARY KEY (TRAIN_NUMBER,START_STN_CODE,WDATE,EMP_ID),
    FOREIGN KEY (TRAIN_NUMBER) REFERENCES TRAIN,
    FOREIGN KEY (START_STN_CODE) REFERENCES STATION,
    FOREIGN KEY (END_STN_CODE) REFERENCES STATION,
    FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE
);

--RELATIONS DROPPING
DROP TABLE TRAIN;
DROP TABLE TRAIN_DETAILS;
DROP TABLE STATION;
DROP TABLE PNR;
DROP TABLE PASSENGER;
DROP TABLE EMPLOYEE;
DROP TABLE COUNTER;
DROP TABLE STALL_DETAILS;
DROP TABLE STATION_WORKERS;
DROP TABLE COUNTER_EMP;
DROP TABLE SCHEDULE;
DROP TABLE WEEK_SCHEDULE;
DROP TABLE CURRENT_WORKERS;
DROP TABLE TRAIN_TYPE;