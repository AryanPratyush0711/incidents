// using scp.cloud as my from '../db/schema.cds';

// service IncidentService {
// 	@readonly entity SafetyIncidents as projection on my.SafetyIncidents;
// }
// using scp.cloud from '../db/schema';

// service IncidentService {
//   entity SafetyIncidents as projection on cloud.SafetyIncidents;
//   entity SafetyOfficers as projection on cloud.Individual;
// }
using scp.cloud from '../db/schema';

service IncidentService {

entity SafetyIncidents as projection on cloud.SafetyIncidents {*,assignedIndividual: redirected to Individual };

entity Individual as projection on cloud.Individual {*,safetyIncidents : redirected to SafetyIncidents};

entity SafetyIncidentsNoImages as projection on cloud.SafetyIncidents{ID ,createdAt, priority, incidentStatus,description};

entity IncidentPhotos as projection on cloud.IncidentPhotos {*,safetyIncident : redirected to SafetyIncidents};

entity IncidentHistory as projection on cloud.IncidentHistory {*,safetyIncident : redirected to SafetyIncidents};
entity demo as projection on cloud.demoEntity;
entity GlobalRegion as projection on cloud.GlobalRegion;
entity BusinessUnit as projection on cloud.BusinessUnit;
entity Country as projection on cloud.Country;

entity IncidentsByCategory as select from cloud.SafetyIncidents {count(ID) as categories:Integer,key category} Group By category;

@readonly entity Category as projection on cloud.Category;
@readonly entity Priority as projection on cloud.Priority;
@readonly entity demo1 as projection on cloud.demoEntity ;


}