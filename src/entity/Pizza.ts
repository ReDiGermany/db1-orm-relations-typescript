import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  ManyToMany,
  JoinTable,
} from "typeorm";
import { Zutaten } from "./Zutaten";
import { Grundrezepte } from "./Grundrezepte";
@Entity()
export class Pizza {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  beschreibung: string;

  @ManyToOne((type) => Grundrezepte, (rezept) => rezept.id)
  grundrezepte: Grundrezepte[];

  @ManyToMany((type) => Zutaten, (zutaten) => zutaten.pizza)
  @JoinTable()
  zutaten: Zutaten[];
}
