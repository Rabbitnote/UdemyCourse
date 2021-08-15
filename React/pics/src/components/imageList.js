import React from 'react';
import '../App.scss';
import ImageCard from './imageCard';

const ImageList = props => {
    const images = props.images.map((image) => {
        return (
            <ImageCard
            image={image}
                key={image.id}
            />
        );
    });
    return <div className='container'>{images}</div>;
};
export default ImageList;
