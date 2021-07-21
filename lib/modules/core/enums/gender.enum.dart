enum Gender {
  male,
  female,
}

String genderLabel(Gender gender) {
  if (gender == Gender.male)
    return "Male";
  else
    return "Female";
}
