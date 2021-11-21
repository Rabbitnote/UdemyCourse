import React from 'react';
import { connect } from 'react-redux';
import { fetchPostAndUser } from '../actions';
import UserHeader from './UserHeader';
import '../style/postList.scss';
class PostList extends React.Component {
    componentDidMount() {
        this.props.fetchPostAndUser();
    }
    renderList() {
        return this.props.posts.map((post) => {
            return (
                <div key={post.id} class='container'>
                    <div class='container_detail'>
                        <img
                            src='../../image/user.png'
                            class='container_img'
                            alt=''
                        />
                        <div class='detail'>
                            <h2>{post.title}</h2>
                            <p>{post.body}</p>
                            <UserHeader userId={post.userId}/>
                        </div>
                    </div>
                </div>
            );
        });
    }
    render() {
        return <div>{this.renderList()}</div>;
    }
}
const mapStateToProps = (state) => {
    return { posts: state.posts };
};
export default connect(mapStateToProps, { fetchPostAndUser })(PostList);
