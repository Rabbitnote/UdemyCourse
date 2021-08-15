import axios from 'axios';

export default axios.create({
    baseURL: 'https://api.unsplash.com',
    headers: {
        Authorization: 'Client-ID XNYWppoGmMLbL9MqzU4d-OPdsSBthTshGlC9WVrmigA'
    }
});
