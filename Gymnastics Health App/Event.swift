//
//  Event.swift
//  Gymnastics Health App
//
//  Created by Joshua Liu on 9/12/24.
//

import Foundation

class Event: Identifiable { //structs are value types, classes are reference type
    var id = UUID() //SwiftUi requires unique identifier to put in ForEach loop
    var eventName: String
    var skills: [Skill]
    //@StateObject treats the view created in as owner
    //All future places this object is passed should use @ObservedObject
    
    init(_ eventName: String,_ skills: [Skill]) {
        self.eventName = eventName
        self.skills = skills
    }
    
    func addSkill(_ skill: Skill) {
        skills.append(skill)
    }
    func removeSkill(_ skill: Skill) {
        //if let checks that it is valid before unwrapping
        //$0 references each element of array
        if let index = skills.firstIndex(where: {$0.id == skill.id}) {
            skills.remove(at: index);
        }
    }
}

class EventManager: ObservableObject {
    //ObservableObjects tell swift to look and update the views anytime this object changes
    @Published var events: [Event] = []
    //Published indicates what the ObservableObject is watching to see if changes happen
    
    init(skillManager: SkillManager) {
        //despite being "let" in the init()
        //these arrays are still mutable,
        //it just means that this direct
        //reference is constant, not that
        //the internal data is constant
        let FX = Event("Floor", skillManager.FXSkills)
        let PH = Event("Pommel Horse", skillManager.PHSkills)
        let SR = Event("Rings", skillManager.SRSkills)
        let VT = Event("Vault", skillManager.PBSkills)
        let PB  = Event("Parallel Bars", skillManager.VTSkills)
        let HB = Event("HighBar", skillManager.HBSkills)
        
        events = [FX, PH, SR, VT, PB, HB]
    }
}

struct Skill: Identifiable {
    var id = UUID()
    var repsDone: Int
    var skillName: String
    
}

class SkillManager: ObservableObject {
    @Published var FXSkills = [Skill(repsDone: 0, skillName: "Routines")]
    @Published var PHSkills = [Skill(repsDone: 0, skillName: "Routines")]
    @Published var SRSkills = [Skill(repsDone: 0, skillName: "Routines")]
    @Published var VTSkills = [Skill(repsDone: 0, skillName: "Routines")]
    @Published var PBSkills = [Skill(repsDone: 0, skillName: "Routines")]
    @Published var HBSkills = [Skill(repsDone: 0, skillName: "Routines")]
    //initial skill
}
