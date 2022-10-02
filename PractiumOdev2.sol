//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract TodoList { 
   
    struct Todo { 
        //Define Variables
        string text;
        bool completed;
    }

    Todo[] public todos;
    
    
    //Create list as not completed status
    function create(string calldata _text) external {
        todos.push(Todo({ 
            text: _text,
            completed: false
        }));
    }
    
    
    //Update the todos list
    function updateText(uint _index, string calldata _text) external {
        todos[_index].text = _text; 

        Todo storage todo = todos[_index];
        todo.text = _text;
    }
    
    
    //Storage gas optimisation
    function get(uint _index) external view returns (string memory, bool) {
        Todo storage todo = todos[_index]; 
        return (todo.text, todo.completed);
    }

    
    //Completed session
    function toggleCompleted(uint _index) external { 
        todos[_index].completed = !todos[_index].completed;
    }
}