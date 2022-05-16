using System

class ActionAndFuncExamples

	method Execute() as void strict

        self:ExecuteActionWithMethod()
        self:ExecuteActionWithLamda()

        self:ExecuteFunction()

        return

    private method MessageMethodForAction(msg as string) as void strict
        // This method will be assigned to an action
        Console.WriteLine("From Method:" + msg)
        return

    private method MethodWithActionAsParameter(action as Action<string>, msg as string) as void
        // This method get's an action as parameter and executes the action
        action?:Invoke(msg)
        return

    private method ExecuteActionWithMethod() as void strict
        // Declare an Action with one parameter string and assign null
        local messageAction := null as Action<string>;
        
        // Execute the Action with null check -> Does nothing, because messageAction is null
        messageAction?:Invoke("Message Action 1")
        
        // assign a method and execute it
        messageAction := MessageMethodForAction
        messageAction?:Invoke("Message Action 2.1")

        // Invoke without null check (throws an exception, if messageAction is null)
        messageAction("Message Action 2.2")

        // Pass the action variable to a method
        self:MethodWithActionAsParameter(messageAction, "Message 3")

        // clear the messageAction
        messageAction := null
        messageAction?:Invoke("Message 4")
        return

    private method ExecuteActionWithLamda() as void strict
        // Declare an Action with one parameter string
        local messageAction := null as Action<string>;
        
        // Execute the Action with null check -> Does nothing, because messageAction is null
        messageAction?:Invoke("Message Lambda 1")
        
        // assign a simple lambda expression and execute it
        messageAction := { m => Console.WriteLine("From Lambda:" + m) }
        
        // Invoke with null check
        messageAction?:Invoke("Message Lambda 2.1")

        // Invoke without null check (throws an exception, if messageAction is null)
        messageAction("Message Lambda 2.2")
        
        // Pass the action as lambda to a method 
        self:MethodWithActionAsParameter(messageAction, "Message 3")

        // clear the messageAction
        messageAction := null
        messageAction?:Invoke("Message 4")
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