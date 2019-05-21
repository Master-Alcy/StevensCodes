import React, { Component } from "react";
//import { Container } from 'react-bootstrap';
import { Card } from 'react-bootstrap';
import queries from '../queries';
import { Query } from 'react-apollo';
import AddComment from './Comments/AddComment';
import LikeComment from "./LikeComment";

class ArticleItem extends Component {
    constructor(props) {
        super(props);
        this.state = {
            id: '',
            key: 0.1,
            showAddComment: false
        };
        this.handleOpenAddComment = this.handleOpenAddComment.bind(this);
        this.handleClose = this.handleClose.bind(this);
    }
    handleOpenAddComment() {
        this.setState({ showAddComment: true });
    }
    componentDidMount() {
        const id = this.props.match.params.id
        this.setState({ id: id });
    }
    handleClose() {
        this.setState({ key: Math.random() })
    }

    sortByKey(array, key) {
        return array.sort(function(a, b) {
            var x = a[key]; var y = b[key];
            return ((x > y) ? -1 : ((x < y) ? 1 : 0));
        });
    }

    render() {
        console.log("state", this.state.id);
        return (
            <Query query={queries.GET_ONLY_BLOG}
                variables={{ id: this.state.id }}
            >
                {({ loading, error, data, refetch }) => {
                    if (loading) {
                        console.log("loading");
                        return null;
                    }
                    if (error) return `Error: ${error}`
                    if (!data) {
                        console.log("Data not found");
                        return (
                            <div>
                            </div>
                        );
                    }
                    refetch();

                    const { getBlog } = data;
                    if (!getBlog) {
                        return (
                            <div>
                            </div>
                        );
                    } else {
                        let arr = this.sortByKey(getBlog.comments, 'likes');
                        let divArr = [];

                        for (let i in arr) {
                            divArr.push(<Card key={i}><div><b>{arr[i].postedBy.name}:</b> {arr[i].content} <br/> <LikeComment all={arr[i]}/> </div></Card>)
                        }

                        return (
                            <div>
                                <Card>
                                    <Card.Body>
                                        <Card.Title>{getBlog.title}</Card.Title>
                                        <Card.Subtitle className="mb-2 text-muted">Created At: {getBlog.createdAt}</Card.Subtitle>
                                        <Card.Subtitle className="mb-2 text-muted">Updated At: {getBlog.updatedAt}</Card.Subtitle>

                                        <br />
                                        <Card.Text>
                                            {getBlog.article}
                                        </Card.Text>
                                        <br />
                                        <div >{getBlog.postedBy.name}</div>
                                    </Card.Body>
                                </Card>
                                <br />
                                <br />
                                <div>
                                    {divArr}
                                </div>
                                <br />

                                <AddComment blogId={this.state.id} handleClose={this.handleClose} />
                                <div hidden={true}>{this.state.key}</div>
                            </div>
                        );
                    }
                }
                }
            </Query>
        );
    }
}


export default ArticleItem;