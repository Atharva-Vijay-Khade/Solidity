import React, { Component } from 'react';

// function based component
// const SearchBar = ()=> {
//     return <input/>;
// }



// using a class based component 
class SearchBar extends Component {

    // constructor to create a state of this component
    constructor(props){
        super(props);

        // here we actually create states " A STATE MAP ACTUALLY! "
        this.state = {term : 'enter video text here'};
    }

    
    render() {

        return (
            // creating a controlled input component
            <input 
                value = {this.state.term}
                onChange = {(input)=>this.processSearch(input.target.value)}
            />
        );

    }

    processSearch(term) {
        this.setState({term});
        this.props.findVideo(term);
    }

    // render() {

    //     // must always return a JSX
    //     return <input onChange={this.onInputChanged}/>;
    //     // OR 
    //     // return <input onChange={ event => console.log(event.target.value) } />
    // }

    // // creating an eventhandler 
    // onInputChanged(event) {
    //     console.log(event.target.value);
    // }

}

// OR WE CAN USE ES6 Syntax to use a arrow function in onChange of input tag

export default SearchBar;