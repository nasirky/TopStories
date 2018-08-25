//
//  Urls.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import Foundation
struct ApiConstants {
    struct NYTimesApi {
        struct Urls {
            /// The base url of NewYork Times API
            static let Base = "https://api.nytimes.com/"
            /// The url for Services endpoint
            static let Services = Base.appending("svc/")
            
            static let TopStories = "topstories/v2/home.json"
        }
        struct Params {
            static let ApiKey = "api-key"
        }
        struct Values {
            static let ApiKey = "e84742bfaf6f4c5b97a5090f84149b3f"
        }
    }
    
    struct Error {
        static let NoData = "No Data received from the server"
    }
}
