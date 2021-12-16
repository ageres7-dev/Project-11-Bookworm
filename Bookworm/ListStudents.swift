//
//  ListStudents.swift
//  Bookworm
//
//  Created by Sergey Dolgikh on 16.12.2021.
//

import SwiftUI

struct ListStudents: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Student.name, ascending: true)],
        animation: .default
    )
        var students: FetchedResults<Student>
    
//    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    
    
    var body: some View {
        VStack {
            
            List {
                ForEach(students, id: \.id!) {
                    Text($0.name!)
                }
            }
            
            Button("Add") {
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!

                let student = Student(context: moc)
                student.name = "\(chosenFirstName) \(chosenLastName)"
                student.id = UUID()
                try? moc.save()
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
}

struct ListStudents_Previews: PreviewProvider {
    static var previews: some View {
        ListStudents()
    }
}
