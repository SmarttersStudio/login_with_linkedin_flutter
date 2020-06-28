///
/// Created By Guru (guru@smarttersstudio.com) on 27/06/20 3:40 PM
///

const linkedInAuthorizationUrl = 'https://www.linkedin.com/oauth/v2/authorization';

const linkedInAccessTokenUrl = 'https://www.linkedin.com/oauth/v2/accessToken';

const linkedInProfileUrl = 'https://api.linkedin.com/v2/me?projection=(id,firstName,lastName,profilePicture(displayImage~:playableStreams))';

const linkedInEmailUrl = 'https://api.linkedin.com/v2/emailAddress?q=members&projection=(elements*(handle~))';
