Feature: add users
As an admin
In order to have users on our website
I want a quick registration process and login page.

Background: the website is up and running
Given I am on the Midnight home page

Scenario: Register a new user
	When I click on the Register button
	Then the page title should be Midnight - Register
