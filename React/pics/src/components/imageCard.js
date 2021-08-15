import React from 'react'
import '../App.scss';

class ImageCard extends React.Component{
    constructor(props){
        super(props);
        this.state ={spans:0};
        this.imageRef = React.createRef();
    }
    componentDidMount(){
        this.imageRef.current.addEventListener('load',this.setSpans);
    }
    setSpans = () =>{
        const height = this.imageRef.current.clientHeight;
        const spans = Math.ceil(height / 150+1);
        this.setState({spans});
    }
    render(){
        const {description,urls}=this.props.image;
        return(<div style={{gridRowEnd:`span ${this.state.spans}`}}>
            <img ref={this.imageRef} className="container_img" src={urls.regular} alt={description}/>
        </div>);
    }
}
export default ImageCard;