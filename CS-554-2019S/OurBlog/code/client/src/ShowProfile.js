import React, { Component } from "react";
import queries from './queries';
import { Query } from 'react-apollo';
<<<<<<< HEAD
import { Card, Container, Row, Col, Button, ListGroup } from 'react-bootstrap';
import { Link } from 'react-router-dom'
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


    render() {
        return (<div>
            <Container>
                <Row className="justify-content-md-center">
                    <Col lg={8}>
                        <Query query={queries.ME}>
                            {({ data, refetch }) => {
                                if (!data) {
                                    return (
                                        <div>
                                        </div>
                                    );
                                }
                                const { me } = data;
                                refetch();
                                if (!me) {
                                    return (
                                        <div>
                                        </div>
                                    );
                                }

                                else {
                                    return (
                                        <div>
                                            <ListGroup className="justify-content-md-center">
                                                <ListGroup.Item >
                                                    <b>Name</b>: {me.name}
                                                </ListGroup.Item>

                                                <ListGroup.Item>
                                                    <b>Email</b>: {me.email}
                                                </ListGroup.Item>

                                                <ListGroup.Item>
                                                    <b>Phone</b>: {me.phone}
                                                </ListGroup.Item>

                                                <ListGroup.Item>
                                                    <b>Interest</b>: {me.interest}
                                                </ListGroup.Item>

                                                <ListGroup.Item>
                                                    <b>Address</b>: {me.address}
                                                </ListGroup.Item>

                                                <ListGroup.Item>
                                                    <b>Blogs</b>: {me.blogs.map((blog, index) => (
                                                        <ul> <a href={`/article/${blog.id}`}>{blog.title}</a></ul>
                                                    ))}
                                                </ListGroup.Item>

                                                <ListGroup.Item>

                                                    <b> Comments</b>: {me.comments.map((comment, index) => (
                                                        <Card.Header> <b>Blog:</b> {comment.forBlog ? <a href={`/article/${comment.forBlog.id}`}>{comment.forBlog.title}</a> : <p>Blog not found</p>}
                                                            <br />
                                                            <ListGroup.Item>  {comment.content} </ListGroup.Item>

                                                        </Card.Header>
                                                    ))}

                                                </ListGroup.Item>


                                            </ListGroup>
                                        </div>


                                    )
                                }
                            }}

                        </Query>
                    </Col>
                </Row>
                <Button variant='outline-primary'>
                    <Link to='/profile/update'>
                        Edit Profile
                     </Link>
                </Button>

            </Container>
        </div>)
    }
}


export default ShowProfile
=======
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
>>>>>>> 887ef9b15c5adc7dcec8b96530399b6466e77bc6
