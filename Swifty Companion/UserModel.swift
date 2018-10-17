//
//  UserModel.swift
//  Swifty Companion
//
//  Created by Felix Ntokozo THWALA on 2018/10/17.
//  Copyright © 2018 Felix Ntokozo THWALA. All rights reserved.
//

import Foundation
import JSONParserSwift

class BaseResponse: ParsableModel {
    /* The Properties */
    var image_url: String?
    var display_name: String?
    var login: String?
    var phone: Int?
    var wallet: Int?
    var correction_point: Int?
    var level: Cursus_users?
    
}

/* Objects */
class Cursus_users: ParsableModel {
    var level: Double?
}

class Skills: ParsableModel {
    var name: String?
    var level: Double?
}

class Project_users: ParsableModel {
    var final_mark: Int?
    var project: Project?
}

class Project: ParsableModel {
    var name: String?
}
