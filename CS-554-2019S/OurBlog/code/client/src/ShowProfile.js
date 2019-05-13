import React, { Component } from "react";
import queries from './queries';
import { Query } from 'react-apollo';
import { Card, Container, Row, Col } from 'react-bootstrap';
import UpdateUser from './components/UpdateUser'
import {Link} from 'react-router-dom'
class ShowProfile extends Component {
    constructor(props) {
      super(props);
      this.state = {
        address: "",
        name: "",
        interest: "",
        complete: false
      };
       
    }
  
     
      render(){
            return (<div>
                <Container>
                    <Row className="justify-content-md-center">
                        <Col lg={8}>
                        <Query query = {queries.ME}>
                        {({ data }) => {
                                    if (!data) {
                                        return (
                                            <div>
                                            </div>
                                        );
                                    }
                                    const { me } = data;
                                    console.log("me data:" , data)
                                    if (!me) {
                                        return (
                                            <div>
                                            </div>
                                        );
                                    }
                                   
                                    else{
                                        console.log("data in blog", data);
                                        return(
                                            <div>
                                               <p>
                                                   Name: {me.name}
                                                   <br/>
                
                                                   Email: {me.email}
                                                   <br/>
                                                   Phone: {me.phone}
                                                   <br/>

                                                    Interest: {me.interest}
                                                    <br/>

                                                Address: {me.address}
                                                <br/>
                                                Blogs:   {me.blogs.map((blog, index) => (
                                                            <p> 
                                                                {blog.title}
                                                            </p>
                                                            ))}
                                               
                                                Comments: {me.comments.map((comment, index) => (
                                                            <p> 
                                                                {comment.content}
                                                                {comment.forBlog ? comment.forBlog.title : <p>Blog not found</p>}
                                                            </p>
                                                            ))}

</p>
</div>
                                                
                                               
                                        )}
                        }}

                        </Query>
                        </Col>
                    </Row>
                    <button >
                    <Link to = '/profile/update'>
                        Edit Profile
                     </Link>
                    </button>
                  
                </Container>
            </div>)
}
}

      
  export default ShowProfile