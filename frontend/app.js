const express = require("express");
const axios = require("axios");
const os = require("os");
const fs = require("fs");
const config = require("./config.json"); // Import configuration
const app = express();
// Use environment variables if available, fallback to config.json
const productsApiBaseUri = process.env.productsApiBaseUri || config.productsApiBaseUri;
const recommendationBaseUri = process.env.recommendationBaseUri || config.recommendationBaseUri;
const votingBaseUri = process.env.votingBaseUri || config.votingBaseUri;
const origamisRouter = require("./routes/origamis");

app.set("view engine", "ejs");
app.use(express.static("public"));
app.use("/api/origamis", origamisRouter);

// Static Middleware
app.use("/static", express.static("public"));

// Endpoint to serve product data to client
app.get("/api/products", async (req, res) => {
  try {
    let response = await axios.get(`${productsApiBaseUri}/api/products`);
    res.json(response.data);
  } catch (error) {
    console.error("Error fetching products:", error);
    res.status(500).send("Error fetching products");
  }
});

app.get("/", (req, res) => {
  // Gather system info
  const systemInfo = {
    hostname: os.hostname(),
    ipAddress: getIPAddress(),
    isContainer: isContainer(),
    isKubernetes: fs.existsSync("/var/run/secrets/kubernetes.io"),
    // ... any additional system info here
  };

  res.render("index", {
    systemInfo: systemInfo,
    app_version: process.env.version || config.version, // provide version to the view
  });
});

function getIPAddress() {
  // Logic to fetch IP Address
  const networkInterfaces = os.networkInterfaces();
  return (
    (networkInterfaces["eth0"] && networkInterfaces["eth0"][0].address) ||
    "IP not found"
  );
}

function isContainer() {
  // Logic to check if running in a container
  try {
    fs.readFileSync("/proc/1/cgroup");
    return true;
  } catch (e) {
    return false;
  }
}

app.get("/api/service-status", async (req, res) => {
  try {
    // Example of checking the status of the products service
    const productServiceResponse = await axios.get(
      `${productsApiBaseUri}/api/products`,
    );

    // Additional checks for more services can be added similarly

    // If code execution reaches here, the service(s) are up
    res.json({
      Catalogue: "up",
      // otherService: 'up' or 'down'
    });
  } catch (error) {
    console.error("Error:", error);
    res.json({
      Catalogue: "down",
      // otherService: 'up' or 'down'
    });
  }
});

app.get("/recommendation-status", (req, res) => {
  axios
    .get(recommendationBaseUri + "/api/recommendation-status")
    .then((response) => {
      res.json({ status: "up", message: "Recommendation Service is Online" });
    })
    .catch((error) => {
      res.json({
        status: "down",
        message: "Recommendation Service is Offline",
      });
    });
});

app.get("/votingservice-status", (req, res) => {
  axios
    .get(votingBaseUri + "/api/origamis")
    .then((response) => {
      res.json({ status: "up", message: "Voting Service is Online" });
    })
    .catch((error) => {
      res.json({ status: "down", message: "Voting Service is Offline" });
    });
});

app.get("/daily-origami", (req, res) => {
  axios
    .get(recommendationBaseUri + "/api/origami-of-the-day")
    .then((response) => {
      res.json(response.data);
    })
    .catch((error) => {
      console.error("Error fetching daily origami:", error);
      res.status(500).send("Error while fetching daily origami");
    });
});

// Health check endpoint
app.get('/health', (req, res) => {
  res.json({
    status: 'healthy',
    service: 'frontend',
    version: config.version || '1.0.0',
    timestamp: new Date().toISOString()
  });
});

// Handle 404
app.use((req, res, next) => {
  res.status(404).send("ERROR 404 - Not Found on This Server");
});

const PORT = process.env.PORT || 3030;
const server = app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

module.exports = server; // Note that we're exporting the server, not app.
