import 'package:flutter/material.dart';

const live_server = 'http://3.131.96.223';
const local_server = 'http://127.0.0.1:8000';

/*----------------------- Login and Registration -----------------------*/
const login_url = '$live_server/api/rest-auth/login/';
const register_url = '$live_server/api/rest-auth/registration/';
const logout_url = '$live_server/api/rest-auth/logout/';
const password_reset_url = '$live_server/api/rest-auth/password/reset/';

/*---------------------------- User Profile ----------------------------*/
const user_profile_url = '$live_server/health_profile/user_profile/';
const follow_unfollow_url = '$live_server/health_profile/follow_unfollow_user/';

/*------------------------------- Recipe -------------------------------*/
const recipe_url = '$live_server/api/recipes/';
const recipe_create_url = '$live_server/api/recipes/create/';
const ingredients_url = '$live_server/api/ingredients/';
const recipe_search_url = '$live_server/api/search_recipe/';

/*-------------------------------- Cart --------------------------------*/
const add_all_to_cart_url = '$live_server/api/cart/addall/';

/*-------------------------------- Filter --------------------------------*/
const geography_url = '$live_server/api/recipe_geography/';
const recipe_type_url = '$live_server/api/recipe_type/';
const recipe_taste_url ='$live_server/api/recipe_taste/';
const recipe_culture_url = '$live_server/api/recipe_culture/';

/*-------------------------------- Nutrition --------------------------------*/
const nutrition_target_url = '$live_server/health_profile/nutrition_target/';

/*-------------------------------- MealPlan --------------------------------*/
const meal_plan_url = '$live_server/mealplan/create_meal_planner/';

/*-------------------------------- Fitbit --------------------------------*/
const fitbit_user_data_url = '$live_server/api/user/fitbit/user_data/';
