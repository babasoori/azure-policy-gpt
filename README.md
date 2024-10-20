# Azure Policy GPT

Azure Policy GPT is an AI-powered Azure Policy Advisor using OpenAI's GPT and RAG (Retrieval-Augmented Generation) technologies.

## Features

- Intelligent Azure Policy suggestions based on best practices and your specific environment
- Natural language interface for creating and managing Azure Policies
- Integration with Azure Policy for seamless deployment and management
- Continuous learning from Azure resource graph and user feedback

## Getting Started

### Prerequisites

- Azure subscription with appropriate permissions
- OpenAI API key
- Python 3.7+
- Azure CLI

### Installation

1. Clone the repository:


    ```shell
    git clone https://github.com/yourusername/azure-policy-gpt.git
    ```

2. Install required dependencies:

    ```shell
    pip install -r requirements.txt
    ```

3. Set up environment variables:

    ```shell
    export OPENAI_API_KEY=your_openai_api_key
    az login
    ```

## Usage

Run the Azure Policy GPT advisor:

```shell
python azure_policy_gpt.py
```

Follow the prompts to describe your policy requirements in natural language. Azure Policy GPT will generate suggested policies and help you refine them.

## Contributing

We welcome contributions! Please read our [Contributing Guide](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Azure Policy documentation](https://learn.microsoft.com/en-us/azure/governance/policy/overview)
- [OpenAI GPT](https://platform.openai.com/docs/overview)

## Support

For questions, feature requests, or bug reports, please open an issue in the GitHub repository.