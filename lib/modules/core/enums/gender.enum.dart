enum Gender {
  male,
  female,
}

String? genderLabel(Gender? gender) {
  if (gender == Gender.male)
    return "Male";
  else if (gender == Gender.female) return "Female";
  return null;
}

String? toString(Gender? gender) {
  if (gender == Gender.male)
    return "male";
  else if (gender == Gender.female) return "female";
  return null;
}

Gender? fromString(String? gender) {
  gender = gender?.toLowerCase();
  if (gender == "male")
    return Gender.male;
  else if (gender == "female") return Gender.female;
  return null;
}
