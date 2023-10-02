create table Wards(
Id int not NULL identity(1,1) primary key,
[Name] nvarchar(50) not NULL constraint ch_wards check ([Name] <>' ') unique,
Department_Id int not NULL foreign key (Department_Id) references Departments(Id)
);

create table Departments(
Id int identity(1,1) primary key,
[Name] nvarchar(50) not NULL constraint ch_Departments check ([Name] <>' ') unique
);

create table Sponsored(
Id int identity (1,1) primary key,
[Name] nvarchar (50) not NULL constraint ch_Sponsored check ([Name] <> ' ') unique
);

create table Donations(
Id int not NULL identity (1,1) primary key,
amount  money not NULL constraint ch_donation check(Amount > 0),
[Date] date not NULL constraint ch_don_date check([Date]> getdate()),
Department_Id int not NULL foreign key (Department_Id)references  Departments(Id),
Sponsored_Id int not NULL foreign key (Sponsored_Id)references  Sponsored(Id)
);


create table DoctorsSpecializations(
Id int not NULL identity (1,1) primary key,
[Name] nvarchar(50) not NULL constraint ch_DoctorsSpecializations check ([Name] <>' ') unique,
Doctor_Id int not NULL foreign key (Doctor_Id)references  Doctors(Id),
Department_Id int not NULL foreign key (Department_Id) references Departments(Id),
Specialization_Id int not NULL foreign key (Specialization_Id) references Specializations(Id)
);


create table Vacations(
Id int not NULL identity (1,1),
[Name] nvarchar (50) not NULL constraint ch_vacation check ([Name] <> ' ') unique,
Doctor_Id int not NULL foreign key (Doctor_Id)references  Doctors(Id),
StartDate date NOT NULL CONSTRAINT ch_start_date CHECK (StartDate > getdate()),
EndDate date NOT NULL CONSTRAINT ch_end_date CHECK (EndDate >= getdate())
);

create table Doctors(
Id int not NULL identity (1,1) primary key,
[Name] nvarchar (50) not NULL constraint ch_doctor check ([Name] <> ' ') unique,
Premium  money not NULL constraint ch_premium check(Premium > 0),
Salary  money not NULL constraint ch_salary check(Salary > 0),
Department_Id int not NULL foreign key (Department_Id)references  Departments(Id),
Wards_Id int not NULL foreign key (Wards_Id)references  Wards(Id)
);


alter table Doctors
add Premium money not NULL default(0) constraint ch_doctor check (Premium > = 0);

alter table Doctors
add Department_Id money not NULL foreign key(Department_Id) references Departments(Id);


INSERT INTO Doctors('Fredi', 0, 5,1,1),. 
value1, value2, value3
);