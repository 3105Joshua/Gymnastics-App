//
//  ContentView.swift
//  Gymnastics Health App
//
//

import SwiftUI
import Charts

//things to work on:
//1. decorate view to be more visually appealing
//2. Fix lines going off edge of screen
//3. Make spacing and organization of skills better
//4. Make skills editable
//5. Increment button

struct ContentView: View {
    //StateObject is used to initialize an ObservableObject
    @StateObject var skillManager = SkillManager()
    @StateObject var eventManager = EventManager(skillManager: SkillManager())
    
    var body: some View {
        NavigationView {
            VStack {
                Text("My Events").font(.title).bold()
                Rectangle().frame(height: 3)
                
                ForEach(eventManager.events) { event in
                    NavigationLink(destination: EventView(eventManager: eventManager, event: event)) {
                        Text(event.eventName)
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                Spacer()
                } //ForEach
            } //Vstack "My Events"
        } //NavView
    } //var body
} //ContentView

struct EventView: View {
    @ObservedObject var eventManager: EventManager
    //@ObservedObject allows watches, cannot modify
    //the variable in the child view
    
    //@Binding allows different Views to share and
    //modify a variable without directly owning it
    
    //@State allows an object to self monitor and
    //refresh itself upon changes
    var event: Event
    @State private var selSkill: Skill? = nil
    @State private var skillName = ""
    @State private var repsDone = ""
    
    var body: some View {
        VStack {
            Text(event.eventName).font(.title).bold()
            Rectangle().frame(height: 3)
            
            
            TextField("Skill Name", text: $skillName)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Reps Done", text: $repsDone)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad) // Number input for reps

            //func ref, no need for closure
            //must take no args and match signature
            Button(action: addSkill) {
                
                Text("Add Skill")
            }
            
            
            
            
            let columns = [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
            
            
            LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                ForEach(event.skills) { skill in
                    HStack{
                        Text("\(skill.skillName): \(skill.repsDone)")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .fixedSize(horizontal: true, vertical: false)
                        //prevents line wrapping and cutting off
                            
                        Spacer()
                        Button(action: {removeSkill(skill)}) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    } //HStack
                }//ForEach
            }.padding(.vertical, 5) //LazyVGrid
            
            Spacer()
        } //Vstack
        
    } //body
    
    func removeSkill(_ skill: Skill) {
        if let index =
            eventManager.events.firstIndex(where: {$0.eventName == event.eventName }) {
            eventManager.events[index].removeSkill(skill)
        }
    }
    
    func addSkill() {
            guard let reps = Int(repsDone) else {
                // Handle invalid input if reps are not a number
                return
            }

            // Add the new skill to the correct event
            if let index = eventManager.events.firstIndex(where: { $0.eventName == event.eventName }) {
                eventManager.events[index].addSkill(Skill(repsDone: reps, skillName: skillName))
            }

            // Clear the input fields after adding
            skillName = ""
            repsDone = ""
    }
    
    
} //EventView



#Preview {
    ContentView()
}
