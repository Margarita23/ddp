# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# user = User.new
# user.email = 'test@example.com'
# user.encrypted_password = 'password1'
# user.save!

user = User.create(email: "test@example.com", password: "password1")

teacher1 = Teacher.create(first_name: "Маргарита", last_name: "Андрюхіна", patronymic: "Василівна", academic_status: "асистент", position: "аспірант", is_leader: false);
teacher2 = Teacher.create(first_name: "Роман", last_name: "Андрюхін", patronymic: "Павлович", academic_status: "професор", position: "професор", is_leader: false);
teacher3 = Teacher.create(first_name: "Владислав", last_name: "Шумко", patronymic: "Костянтинович", academic_status: "к.т.н. доц.", position: "доц. каф.", is_leader: false);
teacher4 = Teacher.create(first_name: "Василь", last_name: "Коркін", patronymic: "Васильович", academic_status: "професор", position: "доц. кав.", is_leader: false);
teacher5 = Teacher.create(first_name: "Павло", last_name: "Мармиза", patronymic: "Александрович", academic_status: "", position: "ст. викладач", is_leader: false);
 
defense = DefenseProcess.create(nameID: 'Захист літо 2023', user_id: user.id);
defense2 = DefenseProcess.create(nameID: 'Захист зима 2023', user_id: user.id);

commission = Commission.create(name: 'Комісія № 3', number: 3);
commission_assignment = CommissionAssignment.create(teacher_id: teacher1.id, commission_id: commission.id);
commission_assignment2 = CommissionAssignment.create(teacher_id: teacher2.id, commission_id: commission.id);
commission_assignment3 = CommissionAssignment.create(teacher_id: teacher3.id, commission_id: commission.id);


group = Group.create(
    form: "Денна", 
    specialization: "Інформаційні - управляючі системи та технології",
    name_number: "гр. КН 01-16-М",
    specialty_code: "122",
    degree: "магістр",
    defense_process_id: defense.id,
    commission_id: commission.id);
