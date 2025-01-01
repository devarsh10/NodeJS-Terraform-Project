const express = require("express");
const AWS = require("aws-sdk");
const dotenv = require("dotenv");

// Load environment variables from .env file
dotenv.config();

const app = express();
const PORT = process.env.PORT || 3000;

// AWS S3 Configuration
const s3 = new AWS.S3({
  accessKeyId: process.env.AWS_ACCESS_KEY_ID,
  secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
  region: process.env.AWS_REGION,
});

const BUCKET_NAME = process.env.BUCKET_NAME;

// Endpoint to list bucket contents
app.get("/list-bucket-content/:path?", async (req, res) => {
  const path = req.params.path || "";

  try {
    const params = {
      Bucket: BUCKET_NAME,
      Prefix: path,
      Delimiter: "/",
    };

    const data = await s3.listObjectsV2(params).promise();

    const directories = (data.CommonPrefixes || []).map((CommonPrefixes) =>
      CommonPrefixes.Prefix.replace("/","").replace(path,"")
    );

    const files = (data.Contents)
      .map((Content) => Content.Key)
      
    const content = [...directories, ...files];

    if(data.Contents.length === 0 && data.CommonPrefixes.length === 0){
      return res.status(400).json({"error":"404 path not found"});
    }
    return res.status(200).json({content});
    
  } catch (error) {
    console.error("Error fetching bucket contents:", error);
    res.status(500).json({ error: error.message });
  }
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}/list-bucket-content`);
});