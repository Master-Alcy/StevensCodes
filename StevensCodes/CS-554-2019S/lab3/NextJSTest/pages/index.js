import axios from 'axios';

import Layout from '../components/Layout';
import Counts from '../components/Counts';

const index = ({ state }) => (
    <Layout>
        <div>
            <h1>Welcome to Next.js</h1>
            <ul>
                <li>Test</li>
                <li>{ state.count }</li>
                <li><Counts num={ state.count } /></li>
                <li><Counts num={ JSON.stringify(state.results) } /></li>
            </ul>
        </div>
    </Layout>
);

index.getInitialProps = async ({ req }) => {
    const res = await axios.get("https://pokeapi.co/api/v2/pokemon");
    console.log(res.data);
    
    return { state: res.data };
}

export default index;