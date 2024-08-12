Here’s a polished version of the `README.md` that clearly explains the repository structure, installation options, and usage instructions for `GoBlazer`, ensuring it’s user-friendly and well-organized:

---

# **GoBlazer**

**GoBlazer** is an open-source command-line tool designed to simplify and automate the management of Terraform configurations and application deployments across multiple environments, including local, development, and production. With a focus on modularity, flexibility, and extensibility, GoBlazer allows users to tailor infrastructure and deployment processes to their specific needs, making it an ideal tool for both individual developers and teams.

## **Features**

- **Modular Terraform Management**: Easily manage infrastructure with reusable Terraform modules.
- **Application Deployment**: Streamline the process of running, deploying, and testing applications.
- **Environment Support**: Seamless management of local, development, and production environments.
- **Customizable Scripts**: Extend functionality with user-defined scripts and plugins.
- **CI/CD Integration**: Integrate seamlessly with CI/CD pipelines using GitHub Actions.
- **Shortcut Commands**: Use concise, intuitive commands for quicker operations.

## **Repository Layout**

Here's an overview of the key directories and files in the `GoBlazer` repository:

```plaintext
goblazer/
│
├── .github/
│   └── workflows/                     # GitHub Actions workflows for CI/CD
│
├── cmd/
│   └── server/
│       └── main.go                    # Main entry point for the Go gRPC server
│
├── scripts/
│   ├── goblazer                       # Main script to dispatch commands
│   ├── aws/                           # AWS-specific scripts
│   │   ├── terraform.sh               # Script for handling AWS Terraform commands
│   │   ├── app.sh                     # Script for handling AWS application commands
│   ├── gcp/                           # GCP-specific scripts
│   │   ├── terraform.sh               # Script for handling GCP Terraform commands
│   │   ├── app.sh                     # Script for handling GCP application commands
│   ├── common/                        # Common scripts for both AWS and GCP
│   │   ├── build_and_deploy_dev.sh    # Dev environment deployment script common to both
│   │   ├── build_and_deploy_prod.sh   # Production environment deployment script common to both
│   │   ├── build_and_deploy_local.sh  # Local environment deployment script common to both
│   │   ├── setup_env.sh               # Script to set up environment variables
│   └── plugins/                       # Directory for custom user scripts
│
├── terraform/
│   ├── aws/                           # AWS-specific Terraform configurations
│   │   ├── dev/                       # AWS Terraform configuration for dev environment
│   │   ├── prod/                      # AWS Terraform configuration for prod environment
│   ├── gcp/                           # GCP-specific Terraform configurations
│   │   ├── dev/                       # GCP Terraform configuration for dev environment
│   │   ├── prod/                      # GCP Terraform configuration for prod environment
│   ├── modules/                       # Reusable Terraform modules (common to both)
│       ├── vpc/                       # Example module for setting up a VPC
│       ├── compute/                   # Example module for setting up compute resources
│       └── database/                  # Example module for setting up databases
│
├── examples/                          # Example configurations for common setups
│   ├── aws/                           # AWS-specific examples
│   ├── gcp/                           # GCP-specific examples
│   └── ci_cd_pipeline/                # Example CI/CD pipeline configuration
│
├── .gitignore                         # Specifies files and directories to ignore
├── LICENSE                            # License file for the project
├── README.md                          # Detailed documentation of the project
├── CONTRIBUTING.md                    # Guidelines for contributing to the project
├── install.sh                         # Script for one-command installation
└── .env.local.example                 # Example environment variables for local development
```

### **Key Directories and Files**

- **`.github/workflows/`**: Contains GitHub Actions workflows for continuous integration and deployment.
- **`cmd/server/main.go`**: The main entry point for the Go gRPC server.
- **`scripts/`**: Contains the core scripts for managing Terraform and application commands. The `aws/` and `gcp/` subdirectories contain cloud-specific scripts, while the `common/` directory houses scripts used by both.
- **`terraform/`**: Contains Terraform configurations for different environments (`dev`, `prod`) for both AWS and GCP, along with reusable Terraform modules.
- **`examples/`**: Provides example configurations for AWS, GCP, and CI/CD pipelines.
- **`.gitignore`**: Specifies files and directories that should be ignored by Git.
- **`LICENSE`**: The license file for the project.
- **`README.md`**: The main documentation file.
- **`CONTRIBUTING.md`**: Provides guidelines for contributing to the project.
- **`install.sh`**: A script to automate the installation process with a single command.

## **Installation**

You can install GoBlazer for AWS, GCP, or both by running one of the following commands:

- **Install AWS Version Only**:
  ```bash
  curl -O https://raw.githubusercontent.com/yourusername/goblazer/main/install.sh && bash install.sh aws
  ```

- **Install GCP Version Only**:
  ```bash
  curl -O https://raw.githubusercontent.com/yourusername/goblazer/main/install.sh && bash install.sh gcp
  ```

- **Install Both AWS and GCP Versions**:
  ```bash
  curl -O https://raw.githubusercontent.com/yourusername/goblazer/main/install.sh && bash install.sh both
  ```

These commands will:
- Clone the `goblazer` repository.
- Set up environment variables.
- Make the `goblazer` script executable.
- Add the appropriate `goblazer` commands to your `PATH`.

### **Usage**

#### **Terraform Commands**

**For AWS**:
- **Plan**: Preview changes Terraform will make:
  ```bash
  goblazer aws terraform dev -plan
  ```
- **Apply**: Apply Terraform changes:
  ```bash
  goblazer aws terraform prod -apply -t aws_lambda_function.my_function
  ```

**For GCP**:
- **Plan**: Preview changes Terraform will make:
  ```bash
  goblazer gcp terraform dev -plan
  ```
- **Apply**: Apply Terraform changes:
  ```bash
  goblazer gcp terraform prod -apply -t google_cloud_run_service.my_service
  ```

**Shortcut Commands**:
- **Shortcuts for Terraform Commands**:
  ```bash
  goblazer aws tf dev -plan     # Shortcut for Terraform plan in AWS dev environment
  goblazer gcp tf prod -apply   # Shortcut for Terraform apply in GCP prod environment
  ```

#### **Application Commands**

- **Run Application Locally**:
  ```bash
  goblazer app local -run my_app
  ```

- **Deploy Application to Production**:

  **For AWS**:
  ```bash
  goblazer aws app prod -deploy my_app
  ```

  **For GCP**:
  ```bash
  goblazer gcp app prod -deploy my_app
  ```

- **Test Application**:
  ```bash
  goblazer app dev -test
  ```

**Shortcut Commands**:
- **Shortcuts for Application Commands**:
  ```bash
  goblazer aws -a -p -r my_app deploy  # Shortcut for deploying AWS app in prod environment
  goblazer gcp -a -d -r my_app run     # Shortcut for running GCP app in dev environment
  ```

#### **Custom Plugins**

Users can add their own custom scripts in the `plugins/` directory. To run a custom script:

```bash
goblazer plugin my_custom_script.sh local
```

## **CI/CD Pipeline**

GoBlazer integrates with GitHub Actions for continuous integration and deployment. The CI pipeline automatically runs tests and deploys to production on each push to the `main` branch.

### **Setting Up Secrets**

#### **For AWS**:
Ensure you have the following secrets set in your GitHub repository:

- `AWS_ACCESS_KEY_ID`: Your AWS access key.
- `AWS_SECRET_ACCESS_KEY`: Your AWS secret access key.
- `AWS_DEFAULT_REGION`: Your AWS region.

#### **For Google Cloud Platform (GCP)**:
Ensure you have the following secrets set in your GitHub repository:

- `GOOGLE_CREDENTIALS`: The content of your service account JSON file.
- `GOOGLE_PROJECT`: Your GCP project ID.
- `GOOGLE_REGION`: Your GCP region.
- `GOOGLE_ZONE`: Your GCP zone.

### **Example GitHub Actions Workflow**

```yaml
name: CI/CD Pipeline

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up Go
      uses: actions/setup-go@v2
      with:
        go-version: '^1.16'

    - name: Install dependencies
      run: go mod tidy

    - name: Run tests
      run: go test ./...

    - name: Deploy to GCP
      if: github.ref == 'refs/heads/main' && github.event_name == 'push'
      run: goblazer gcp terraform prod -apply
      env:
        GOOGLE_CREDENTIALS: ${{ secrets.GOOGLE_CREDENTIALS }}
        GOOGLE_PROJECT: ${{ secrets.GOOGLE_PROJECT }}
        GOOGLE_REGION: ${{ secrets.GOOGLE_REGION }}
        GOOGLE_ZONE: ${{ secrets.GOOGLE_ZONE }}

    - name: Deploy to AWS
      if: github.ref == 'refs/heads/main' && github.event_name == 'push'
      run: goblazer aws terraform prod -apply
      env:
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        AWS_DEFAULT_REGION: ${{ secrets.AWS_DEFAULT_REGION }}
```

## **Customization**

### **Custom Terraform Modules**

- Add your custom modules in the `terraform/modules/` directory.
- Reuse and extend existing modules for managing infrastructure.

### **User-Defined Scripts**

- Place your custom scripts in the `scripts/plugins/` directory.
- Modify `goblazer` to include custom scripts as needed.

### **Example Configurations**

Examples for common setups are provided in the `examples/` directory, including:

- **Web Application Deployment**: Basic setup for deploying a web application.
- **Database Setup**: Example configurations for databases like PostgreSQL.
- **CI/CD Pipeline**: Pre-configured CI/CD pipelines.

## **Contributing**

We welcome contributions! Whether you’re fixing bugs, improving documentation, or adding new features, your help is appreciated. Please see the [CONTRIBUTING.md](CONTRIBUTING.md) file for guidelines on contributing.

## **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

### **Conclusion**

This `README.md` provides clear, platform-specific instructions for using GoBlazer with both Google Cloud Platform and Amazon Web Services. By including shortcut commands, it emphasizes the ease of use and efficiency of the tool, making it more accessible for users looking to streamline their infrastructure and deployment processes.
