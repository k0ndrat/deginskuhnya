// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetAllDishesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAllDishes {
      dishes {
        __typename
        id
        category
        name
        description
        imageURL
      }
    }
    """

  public let operationName: String = "GetAllDishes"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("dishes", type: .nonNull(.list(.nonNull(.object(Dish.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(dishes: [Dish]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "dishes": dishes.map { (value: Dish) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "dishes"
    public var dishes: [Dish] {
      get {
        return (resultMap["dishes"] as! [ResultMap]).map { (value: ResultMap) -> Dish in Dish(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Dish) -> ResultMap in value.resultMap }, forKey: "dishes")
      }
    }

    public struct Dish: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["dishes"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("category", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("imageURL", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, category: Int, name: String, description: String, imageUrl: String) {
        self.init(unsafeResultMap: ["__typename": "dishes", "id": id, "category": category, "name": name, "description": description, "imageURL": imageUrl])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var category: Int {
        get {
          return resultMap["category"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "category")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String {
        get {
          return resultMap["description"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var imageUrl: String {
        get {
          return resultMap["imageURL"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "imageURL")
        }
      }
    }
  }
}

public final class CreateDishMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateDish($category: Int, $description: String, $imageURL: String, $name: String) {
      insert_dishes(
        objects: {category: $category, description: $description, imageURL: $imageURL, name: $name}
      ) {
        __typename
        returning {
          __typename
          id
        }
      }
    }
    """

  public let operationName: String = "CreateDish"

  public var category: Int?
  public var description: String?
  public var imageURL: String?
  public var name: String?

  public init(category: Int? = nil, description: String? = nil, imageURL: String? = nil, name: String? = nil) {
    self.category = category
    self.description = description
    self.imageURL = imageURL
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["category": category, "description": description, "imageURL": imageURL, "name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("insert_dishes", arguments: ["objects": ["category": GraphQLVariable("category"), "description": GraphQLVariable("description"), "imageURL": GraphQLVariable("imageURL"), "name": GraphQLVariable("name")]], type: .object(InsertDish.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(insertDishes: InsertDish? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "insert_dishes": insertDishes.flatMap { (value: InsertDish) -> ResultMap in value.resultMap }])
    }

    /// insert data into the table: "dishes"
    public var insertDishes: InsertDish? {
      get {
        return (resultMap["insert_dishes"] as? ResultMap).flatMap { InsertDish(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "insert_dishes")
      }
    }

    public struct InsertDish: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["dishes_mutation_response"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("returning", type: .nonNull(.list(.nonNull(.object(Returning.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(returning: [Returning]) {
        self.init(unsafeResultMap: ["__typename": "dishes_mutation_response", "returning": returning.map { (value: Returning) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// data from the rows affected by the mutation
      public var returning: [Returning] {
        get {
          return (resultMap["returning"] as! [ResultMap]).map { (value: ResultMap) -> Returning in Returning(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Returning) -> ResultMap in value.resultMap }, forKey: "returning")
        }
      }

      public struct Returning: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["dishes"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int) {
          self.init(unsafeResultMap: ["__typename": "dishes", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}
