import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  OneToOne,
  ManyToOne,
  JoinColumn,
} from "typeorm";
import { Auftrag } from "./Auftrag";
import { Pizza } from "./Pizza";
@Entity()
export class AuftragsPos {
  @PrimaryGeneratedColumn()
  position: number;

  @Column()
  menge: number;

  @ManyToOne((type) => Auftrag, (auftrag) => auftrag.id)
  auftrag: Auftrag[];

  @OneToOne((type) => Pizza)
  @JoinColumn()
  pizza: Pizza;
}
