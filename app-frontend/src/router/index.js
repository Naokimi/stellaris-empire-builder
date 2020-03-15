import Vue from 'vue';
import Router from 'vue-router';
import CreateEmpire from '@/components/CreateEmpire';
import LoadEmpire from '@/components/LoadEmpire';
import Landing from '@/components/Landing';

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Landing',
      component: Landing,
    },
    {
      path: '/load',
      name: 'LoadEmpire',
      component: LoadEmpire,
    },
    {
      path: '/create',
      name: 'CreateEmpire',
      component: CreateEmpire,
    }
  ],
});
