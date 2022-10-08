from pprint import pprint

import click
from kedro.framework.project import pipelines


@click.group(name="JSON")
def commands():
    pass


@commands.group(name="demo")
def demo_commands():
    pass


@demo_commands.command()
@click.pass_obj
def to_json(metadata):
    """Display the pipeline in JSON format"""
    pipeline = pipelines["__default__"]
    pprint(pipeline)
