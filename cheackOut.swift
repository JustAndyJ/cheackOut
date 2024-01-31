class QueueElement {
  var name: String
  var prev: QueueElement?

  init(name: String) {
      self.name = name
      self.prev = nil
  }
}


class Queue {
  
    var primaryChecout: [QueueElement?]

    init() {
 
        primaryChecout = []
        primaryChecout = checkout()
    }

  func showAllQueue() {

      print("\nCustomers on CheckOutCounter:")

      for (index, person) in primaryChecout.enumerated() {
        if person != nil { 
        print("\nthe checout \(index + 1):")
        var aux = person
        var i = 1
        while let currentElement = aux {
          
            print("    Position \(i): \(currentElement.name)")
            aux = currentElement.prev
          i += 1
       }
      }
    }
   callMenuQueue()
  }

  func addElementQueue() {
    
    var checkOutCounter: QueueElement?
    
    print("\nEnter de number of cheackout: ", terminator: "")
    guard let input = readLine(), let intpost = Int(input) else {
      print("Invalid input. Please enter a valid number.")
      return
    }
    if primaryChecout[intpost - 1] == nil {
      checkOutCounter = nil
    } else {
      checkOutCounter = primaryChecout[intpost - 1]
    }
 
    print("\nType the name of the new client in the queue: ", terminator: "")
 
      if let name = readLine() {
          let client = QueueElement(name: name)
          if checkOutCounter == nil {
              checkOutCounter = client
          } else {
              var aux = checkOutCounter
              while aux?.prev != nil {
                  aux = aux?.prev
              }
              aux?.prev = client
          }
      }
      primaryChecout[intpost - 1] = checkOutCounter
      callMenuQueue()
  }

  func removeElementQueue() {
    
      print("Enter de number of cheackout: ", terminator: "")
      guard let input = readLine(), let intpost = Int(input) else {
        print("Invalid input. Please enter a valid number.")
        return
      }
       var checkOutCounter = primaryChecout[intpost - 1]
    
      if let servedCustomer = checkOutCounter {
          print("\nCustomer named: \(servedCustomer.name) was served.")

          checkOutCounter = servedCustomer.prev
      }
      primaryChecout[intpost - 1] = checkOutCounter
      callMenuQueue()
  }

  func callMenuQueue() {
  var option = 0

  repeat {
      
      print("\n\nManager of stock:")
      print("1 - show all person.")
      print("2 - show person for cheackout")
      print("3 - add products.")
      print("4 - remove products.")
      print("5 - exit.")
      print("Type the option: ", terminator: "")

      if let input = readLine(), let inputOption = Int(input) {
          option = inputOption
      } else {
          print("Invalid input. Please enter a valid option.")
          option = 0
      }
  } while option < 0 || option > 4

  switch option {
  case 1: showAllQueue()
  case 2: showOneCheack()
  case 3: addElementQueue()
  case 4: removeElementQueue()
  default: break
  }
}
func showOneCheack() {
  
      print("Enter de number of cheackout: ", terminator: "")
      guard let input = readLine(), let intpost = Int(input) else {
        print("Invalid input. Please enter a valid number.")
        return
      }
      let persons = primaryChecout[intpost - 1]
        if persons != nil { 
          
          print("\nthe checout \(intpost):")
          
          var aux = persons
          var i = 1
          while let currentElement = aux {
              print("    Position : \(i): \(currentElement.name)")
              aux = currentElement.prev
            i += 1
         }
        }
   callMenuQueue()

  
}
  
func checkout() -> [QueueElement?] {
  print("how much checkout do you want?: ", terminator: "")
  
  guard let input = readLine(), let number = Int(input) else {
    print("input error")
    return []
  }
  let numberCheckOu = [QueueElement?](repeating: nil, count: number)
  return numberCheckOu
}
