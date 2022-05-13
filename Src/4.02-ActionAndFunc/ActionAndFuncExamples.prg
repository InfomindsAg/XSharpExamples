using System

class ActionAndFuncExamples

	method Execute() as void strict
        self:ExecuteAction()

        self:ExecuteFunction()
      

        return

    private method ExecuteAction() as void strict
        // Declare an Action with one parameter string
        local messageAction := null as Action<string>;
        
        // Execute the Action with null check -> Does nothing, because messageAction is null
        messageAction?:Invoke("Message 1")
        
        // assign a simple lambda expression and execute it
        messageAction := { m => Console.WriteLine("From Lambda:" + m) }
        
        // Invoke with null check
        messageAction?:Invoke("Message 2.1")

        // Invoke without null check (throws an exception, if messageAction is null)
        messageAction("Message 2.2")


        // assign a simple lambda expression and execute it
        messageAction := MessageMethodForAction
        messageAction?:Invoke("Message 3")

        // Pass the action variable to a method
        self:MethodWithActionParameter(messageAction, "Message 4")

        // Pass the action as lambda to a method 
        self:MethodWithActionParameter({ m => Console.WriteLine("From Lambda as param:" + m) }, "Message 5")

        // clear the messageAction
        messageAction := null
        messageAction?:Invoke("Message 6")

        return
    
    private method MessageMethodForAction(msg as string) as void strict
        Console.WriteLine("From Method:" + msg)
        return

    private method MethodWithActionParameter(action as Action<string>, msg as string) as void
        action?:Invoke(msg)
        return



    private method ExecuteFunction() as void strict
        // declare a function with two int parameter and a string result. The last type is always the return value
        local mathFunction as func<int, int, string> 
        
        mathFunction := { param1, param2 => (param1 + param2).ToString() }

        // Invoke function with null check
        Console.WriteLine(mathFunction?.Invoke(1, 2))
        
        // Invoke function without null check
        Console.WriteLine(mathFunction(1, 2))

        // change function 
        mathFunction := { param1, param2 => (param1 * param2).ToString() }
        Console.WriteLine(mathFunction(1, 2))
    
    return 

end class