import React from 'react';

const Loading = (props) => {
    return (<div className='container'><div className='load'> </div><label className='textLoad'>{props.message}</label></div>);
};
Loading.defaultProps={
    message:'Loading...'

}
export default Loading;
