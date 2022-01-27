
import Foundation

struct requestData: Codable {
    
    let age : Int?
    let image : String?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case age = "age"
        case image = "image"
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        age = try values.decodeIfPresent(Int.self, forKey: .age)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}
