import dva from 'dva';
import { createModel } from '@/store';
import App from './App';

const createHashHistory = require('history').createHashHistory;
const app = dva(createHashHistory);

createModel(app);
app.router(App);
app.start('#root');
