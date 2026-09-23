"""API keys from environment variables: OPENAI_API_KEY, OPENROUTER_API_KEY, ANTHROPIC_API_KEY (and HF_TOKEN for the
gated HLE dataset). Keys are only held in-process and never printed."""

import os


def secret_field(name: str) -> str:
    val = os.environ.get(name)
    if not val:
        raise RuntimeError(f"set {name} in the environment")
    return val


def openai_key(name: str | None = None) -> str:
    """OpenAI key from the environment; `name` (the runner's --key-env) overrides the default variable."""
    return secret_field(name or "OPENAI_API_KEY")
