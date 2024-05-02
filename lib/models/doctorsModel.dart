List<Map<String,dynamic>>doctorsList = [
  {
    'name': 'Dr. John Doe',
    'specialty': 'Cardiologist',
    'hName': 'Aster Medcity ',
  },  {
    'name': 'Dr. Jane Smith',
    'specialty': 'Orthopedic Surgeon',
    'hName': 'Aster Medcity ',
  },  {
    'name': 'Dr. Michael Johnson',
    'specialty': 'Pediatrician',
    'hName': 'Appolo Hospital',
  },  {
    'name': 'Dr. Emily Brown',
    'specialty': 'Dermatologist',
    'hName':  'Appolo Hospital',
  },  {
    'name': 'Dr. David Wilson',

    'specialty': 'Neurologist',
    'hName': 'Manipal Hospital',
  },  {
    'name': 'Dr. Sarah Garcia',
    'specialty': 'Gynecologist',
    'hName': 'Manipal Hospital',
  },  {
    'name': 'Dr. Christopher Lee',
    'specialty': 'ENT Specialist',
    'hName': 'Fortis Hospital ',
  },  {
    'name': 'Dr. Amanda White',
    'specialty': 'Ophthalmologist',
    'hName': 'Fortis Hospital',
  },
];


class DoctorModel{
  final String name;
  final String specialty;
  final String hName;

  DoctorModel({required this.name, required this.specialty, required this.hName});
}