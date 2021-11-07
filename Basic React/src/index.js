import _ from 'lodash';
import React, { Component } from "react";
import ReactDOM from "react-dom";
import SearchBar from "./components/search_bar";
import YTSearch from 'youtube-api-search';
import VideoList from "./components/video_list";
import VideoDetail from "./components/video_details";

// api key 
const API_KEY = "AIzaSyBU3ylkKaIvF150s0KVyPpAGNUWlPLArsI";


// Creating the component / view which will load up the browser 
// with the html mentioned in it

class App extends Component {

    constructor(props) {

        super(props);

        this.state = {
            videos: [],
            selectVideo: null
        };
        
        this.VideoSearch('dude perfect');

    }

    VideoSearch(term) {

        YTSearch({ key: API_KEY, term: term }, videos => {
            this.setState({
                videos: videos,
                selectVideo: videos[0]
            });
        });
        
    }


    render() {

        const videoSearchTimely = _.debounce((term)=>{this.VideoSearch(term)},1000);

        return (<div>
            <SearchBar
                findVideo = {videoSearchTimely}
            />
            <VideoDetail video={this.state.selectVideo} />
            <VideoList
                changeVideo={(selectVideo) => { this.setState({ selectVideo }) }}
                videos={this.state.videos}
            />
        </div>
        );
    }

}

// we can also write like this new ES6 syntax
// const App = () => { 
//     return <div>Hi!</div> 
// }

// Take this component's generated HTML and put it 
// on the page { or in the DOM / document object model { decribes the html/xml structure } }
// this is required as it takes this html code on the frontend 

ReactDOM.render(<App />, document.querySelector('.container'));
