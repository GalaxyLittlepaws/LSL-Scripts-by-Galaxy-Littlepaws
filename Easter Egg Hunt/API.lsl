// Notes: This is completely optional. If you don't want to use it, you do not need to drop it into the prim.
// This script is used to make HTTP requests to a web server. You may use whatever you like for the backend API.
// ~Work in Progress~

string baseURL = "http://www.yourdomain.com/"; // Change this to your domain


default
{
    state_entry()
    {
        llResetScript(); // Reset this script on rez
    }

    // When llHTTPRequest is done, this function is called
    http_request(key request_id, integer status, list metadata, string body)
    {
        if (status == 200)
        {
            // Put whatever you want to do with the data here
        }
        else if (status == 404)
        {
            // Put whatever you want to do if the file is not found here
        }
        else
        {
            // Put whatever you want to do if there is an error here
        }
    }
}
