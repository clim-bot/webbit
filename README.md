# Webbit

A _nearly_ full-featured Reddit clone build with Ruby on Rails. The App is the result of a course called Hello Rails at [hellorails.io](https://hellorails.io)

## Modeling

Each model will be responsible for different data throughout the app.

- User - focused on the user.
- Submission - The user authors this. Has different media (text, image/video, link)
- Community - Category based on submissions
- Comments - A responsive given to the submission from another user to a given user.
- Subscription - Not to be confused with billing. A user can subscribe and unsubscribe to a community.