namespace scp.cloud;

using
{
    cuid,
    managed,
    sap.common
}
from '@sap/cds/common';

entity SafetyIncidents : cuid, managed
{
    title : String(50)
        @title : 'Title';
    category : Association to one Category
        @title : 'Category';
    priority : Association to one Priority
        @title : 'Priority';
    incidentStatus : Association to one IncidentStatus
        @title : 'IncidentStatus';
    description : String(1000)
        @title : 'Description';
    incidentResolutionDate : Date
        @title : 'ResolutionDate';
    assignedIndividual : Association to one Individual;
    incidentPhotos : Association to many IncidentPhotos on incidentPhotos.safetyIncident = $self;
    incidentHistory : Association to many IncidentHistory on incidentHistory.safetyIncident = $self;
}

entity Individual : cuid, managed
{
    firstName : String
        @title : 'First Name';
    lastName : String
        @title : 'Last Name';
    emailAddress : String
        @title : 'Email Address';
    safetyIncidents : Association to many SafetyIncidents on safetyIncidents.assignedIndividual = $self;
}

entity IncidentHistory : cuid, managed
{
    oldStatus : Association to one IncidentStatus
        @title : 'OldCategory';
    newStatus : Association to one IncidentStatus
        @title : 'NewCategory';
    safetyIncident : Association to one SafetyIncidents;
}

entity IncidentPhotos : cuid, managed
{
    imageType : String
        @Core.IsMediaType;
    image : LargeBinary
        @Core.MediaType : imageType;
    safetyIncident : Association to one SafetyIncidents;
}

entity IncidentsCodeList : common.CodeList
{
    key code : String(20);
}

entity Category : IncidentsCodeList
{
}

entity Priority : IncidentsCodeList
{
}

entity IncidentStatus : IncidentsCodeList
{
}

entity demoEntity
{
    key RequestId : UUID;
    RequestType : String(100);
    RequestorEmail : String(100);
    FirstName : String(100);
    LastName : String(100);
    GlobalRegion : Association to GlobalRegion
    @title:'globalRegion';
    BusinessUnit : Association to BusinessUnit
    @title:'BusinessUnit';
    Function : String(100);
    Country : Association to Country
    @title:'Country';
    ExpectedDueDate : Date;
    Priority : String(100);
    CreatedOnDate : Date;
    Comments : String(100);
}
entity GlobalRegion:common.CodeList
{
    key praneeth : String(20);
}
entity BusinessUnit:common.CodeList
{
    key code : String(20);
}
entity Country:common.CodeList
{
    key code : String(20);
}