# Prompting Strategies for Azure Policy Definitions

## 1. Examples of Prompts

### A. Basic Prompt

System Message:

```text
You are an AI assistant specialized in generating Azure Policy definitions. Provide accurate and well-formatted JSON code based on the user's request.
```

User Message:

```text
Generate an Azure Policy that denies the creation of storage accounts without encryption enabled.
```

### B. Detailed Prompt with Context

System Message:

```text
You are an expert Azure governance assistant. Generate Azure Policy definitions in JSON format, ensuring they comply with best practices and include necessary metadata like display name and description.
```

User Message:

```text
I need a policy that enforces encryption at rest for all Azure SQL Databases. The policy should audit databases that do not have Transparent Data Encryption (TDE) enabled.
```

### C. Prompt with Specific Formatting Instructions

System Message:

```text
You are an AI assistant that generates Azure Policy definitions. Provide the output in JSON format enclosed in triple backticks (```json), and include comments explaining each section of the policy.
```

User Message:

```text
Create a policy that requires all virtual machines to use managed disks. Include parameters to make the policy reusable for different disk types.
```

### D. Prompt Leveraging Compliance Standards

System Message:

```text
You are an AI assistant specializing in Azure compliance. Generate Azure Policy definitions that align with the specified compliance standards.
```

User Message:

```text
Generate an Azure Policy that enforces CIS Benchmark requirements by denying public network access to Azure Key Vaults.
```

### E. Multi-Part Prompt for Complex Policies

System Message:

```text
You are an Azure Policy expert. When generating policies, first outline the policy's purpose, then provide the JSON code. Ensure the policy includes parameters, display name, description, and is formatted correctly.
```

User Message:

```text
I need a policy that restricts resource creation to specific regions: East US and West Europe. The policy should deny any resources created outside these regions.
```

## 2. Prompting Strategies

### A. Be Specific and Clear

- Detail the Requirements:
  - Clearly state what the policy should enforce.
  - Include any conditions, exceptions, or constraints.
- Example:

```text
Generate an Azure Policy that denies the creation of virtual machines with public IP addresses unless they are in the 'DMZ' resource group.
```

### B. Define the Desired Output Format

- Specify Formatting Instructions:
  - Indicate that the output should be in JSON.
  - Request code blocks or specific formatting if needed.
- Example:

```text
Provide the Azure Policy definition in JSON format, enclosed within triple backticks for proper formatting.
```

### C. Provide Context and Background

- Include Relevant Information:
  - Mention compliance standards or organizational policies.
  - Provide any necessary background to guide the AI.
- Example:

```text
In accordance with our company's security policy, generate an Azure Policy that audits any storage account that doesn't have Secure Transfer required.
```

### D. Use Step-by-Step Instructions

- Break Down Complex Requests:
  - Guide the AI through the process of generating the policy.
  - Request an outline or explanation before the code.
- Example:


```text
First, summarize the policy's purpose. Then, provide the Azure Policy definition in JSON format that ensures all Azure SQL Databases have threat detection enabled.
```

### E. Incorporate Examples in the Prompt

- Provide Samples or Templates:
  - Include an example policy or code snippet.
  - Use it as a reference for the AI to follow.
- Example:

```text
Using the following example as a template, create a policy that requires all app services to use HTTPS:

Example Policy:
```json
{ ... }
```

### F. Limit the Scope

- Focus on One Requirement at a Time:
  - Avoid overloading the prompt with multiple requests.
  - Ensure the AI can address the requirement thoroughly.
- Example:

```text
Generate a policy that enforces tagging by requiring the 'Environment' tag on all resources.

```

## 3. Comparisons of Prompts with Pros and Cons

### A. Basic Prompt

Prompt:

```text
Generate an Azure Policy that denies the creation of storage accounts without encryption enabled.
```

Pros:

- Simplicity: Easy to write and quick to generate a response.
- Clarity: Directly states the requirement.

Cons:

- Lack of Detail: May not include necessary metadata like display name or description.
- Potential Ambiguity: Without specifying the output format, the response may vary.

### B. Detailed Prompt with Context

Prompt:

```text
I need a policy that enforces encryption at rest for all Azure SQL Databases. The policy should audit databases that do not have Transparent Data Encryption (TDE) enabled.
```

Pros:

- Specificity: Clearly defines the resource type and the exact requirement.
- Guidance: Indicates the desired effect (audit).

Cons:

- Moderate Complexity: Slightly longer prompt may consume more tokens.
- Assumes Knowledge: Relies on the AI understanding terms like TDE.

### C. Prompt with Specific Formatting Instructions

Prompt:

```text
Create a policy that requires all virtual machines to use managed disks. Include parameters to make the policy reusable for different disk types. Provide the output in JSON format enclosed in triple backticks (```json).
```

Pros:

- Output Control: Ensures the response is formatted correctly.
- Reusability: Encourages the creation of a flexible policy.

Cons:

- Increased Token Usage: Additional instructions consume more tokens.
- Complexity: More detailed instructions may risk misinterpretation if not clearly stated.

### D. Prompt Leveraging Compliance Standards

Prompt:

```text
Generate an Azure Policy that enforces CIS Benchmark requirements by denying public network access to Azure Key Vaults.
```

Pros:

- Alignment with Standards: Ensures policies comply with recognized benchmarks.
- Specificity: Targets a particular compliance requirement.

Cons:

- Assumption of Compliance Mapping: Requires the AI to correctly map the compliance requirement to policy logic.
- Potential for Misalignment: If the AI misinterprets the compliance standard, the policy may not fully meet requirements.

### E. Multi-Part Prompt for Complex Policies

Prompt:

```text
I need a policy that restricts resource creation to specific regions: East US and West Europe. The policy should deny any resources created outside these regions. Provide the policy's purpose first, then the JSON code.
```

Pros:

- Clarity and Structure: Breaking down the response aids understanding.
- Documentation: Including the purpose helps with policy management.

Cons:

- Longer Response: May consume more tokens due to additional content.
- Possible Overhead: If only the code is needed, the extra information may be unnecessary.

## 4. Recommendations and Best Practices

### A. Balance Detail with Brevity

- Aim for Clarity: Provide enough detail to avoid ambiguity but keep the prompt concise to manage token usage.
- Avoid Unnecessary Information: Exclude irrelevant details that do not contribute to the desired output.

### B. Test and Refine Prompts

- Iterative Approach: Try different prompt styles and evaluate the AI’s responses.
- Adjust Based on Results: If the output isn’t as expected, modify the prompt accordingly.

C. Be Explicit About Requirements

- Define Output Expectations: Clearly state if you need comments, metadata, parameters, etc.
- Specify Constraints: Mention any limitations or specific conditions the policy should address.

D. Leverage the System Message Effectively

- Set the Assistant’s Role: Use the system message to establish the AI’s expertise and response style.
- Keep It Concise: A brief but informative system message conserves tokens for the user prompt and response.

### E. Manage the Context Window

- Summarize When Necessary: For longer interactions, provide summaries to maintain context without exceeding token limits.
- Focus on Current Requirements: Ensure the prompt includes all necessary information for the current request.

## 5. Conclusion

By experimenting with different prompt styles and applying effective prompting strategies, you can enhance the AI’s ability to generate accurate and useful Azure Policy definitions. Remember to:

- Be Clear and Specific: Provide detailed requirements to guide the AI.
- Control the Output Format: Specify how you want the response to be presented.
- Iterate and Improve: Continuously test and refine your prompts based on the AI’s performance.
- Balance Token Usage: Be mindful of the context window and costs associated with token consumption.

Feel free to use these examples and strategies as a starting point for developing your own prompts. If you have further questions or need assistance with specific prompts or policies, I’m here to help!