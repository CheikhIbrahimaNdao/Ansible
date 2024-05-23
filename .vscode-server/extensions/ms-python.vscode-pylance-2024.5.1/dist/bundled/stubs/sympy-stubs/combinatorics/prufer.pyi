from typing import Any, Literal, Self
from sympy.core import Basic

class Prufer(Basic):
    _prufer_repr = ...
    _tree_repr = ...
    _nodes = ...
    _rank = ...
    @property
    def prufer_repr(self) -> list[Any]:
        ...
    
    @property
    def tree_repr(self) -> list[Any]:
        ...
    
    @property
    def nodes(self) -> None:
        ...
    
    @property
    def rank(self) -> int:
        ...
    
    @property
    def size(self) -> int:
        ...
    
    @staticmethod
    def to_prufer(tree, n) -> list[Any]:
        ...
    
    @staticmethod
    def to_tree(prufer) -> list[Any]:
        ...
    
    @staticmethod
    def edges(*runs) -> tuple[list[Any], Any]:
        ...
    
    def prufer_rank(self) -> Literal[0]:
        ...
    
    @classmethod
    def unrank(cls, rank, n) -> Prufer:
        ...
    
    def __new__(cls, *args, **kw_args) -> Self:
        ...
    
    def next(self, delta=...) -> Prufer:
        ...
    
    def prev(self, delta=...) -> Prufer:
        ...
    

